# ProPresenter6-Shaders
Have you ever wished in ProPresenter 6, that you could simply rotate one of those pesky videos/images that you sometimes get from mobile phones?.....You know the ones that display sideways or upside down.

Each media effect (Color Invert, Blur, Adjust Color etc) in ProPresenter 6 is actually made up of 3 files which are located in the program folder of ProPresenter 6.  This is true for both the MacOS and Windows versions of ProPresenter 6.

These files, which define each effect, are human readable text files.  Two of the three files are standard GLSL files (.frag and .vert), and the third is proprietry format that descibes the effect name and adjustable parameters (.rvfx).

I have found (much to my surprise and joy) that you can create your own files for new effects and simply copy them to the folder where ProPresenter keeps all its standard effects files - and ProPresenter will add and use your new effect.

So a single effect in Pro6 is actually made of three files - Which you and I can edit or create!

I don't know GLSL at all, but I was able to read the existing effects files and figure out how to add a few effects that I always wished ProPresenter had: Rotation, Scale and Translation of media.  Finally I have a way to rotate those pesky videos and images that I sometime get from mobile phones in all sorts of wonderful orientations.

By the way, the first effect I created was for opacity - I have included that here just "for kicks", as I am not sure if there is any valid use for it - other than being a good "Hello World" experience for me getting started in this exercise.

To use one of these effects copy the three files that make the effect to the folder where ProPresenter 6 stores all it's media effects files and then (re)start ProPresenter 6, right-click any slide with a media cue (or any media in the Video/Image bin) and select "Properties" and go to the effects panel where you will see the new effect included in the list of standard effects.

Tips:
* To rotate a phone image/video - you will typically want 90, 180, or 270 degrees - it's more accurate to type this than to use the slider to adjust the angle.
* If you rotate "sideways" (90 or 270), you will need to manually scale the media down to fit the screen. *Start* by scaling the Y (height) until that fits and simply match the X (width) scale
* The scale has separate controls for X (width) and Y (height) - make them the same to keep the aspect ratio the same as the original. (Feel free to make them different to fix stretched videos/pictures too!)
* Order matters - you will need to get use to that. The order of operations for the Rotate, Scale Translate effect is the same as it's name: It will FIRST Rotate, and after the image is rotated then it will scale the rotated image and finally translate the result.

To Download, choose the "Clone or Download" green button and choose "Download Zip" to save the zip file which contains all the shader files. (I might add more one day - or maybe *you* will!).  Extract the zip and decide which effect files you want to copy.

So where do I copy the three files for a new custom effect?

The Standard locations for media effect files for ProPresenter 6:

MacOS: /Applications/ProPresenter 6.app/Contents/Frameworks/ssAPI.framework/Versions/A/Resources

Windows: C:\Program Files (x86)\Renewed Vision\ProPresenter 6\shaders

How to remove?
Using these is as simple as copying in the new files. So removing them and "going clean" is just as simple as removing (deleting) any custom shader files you copied.  I have prefixed them all with "Dan*" so they are all listed together when you look at the folder and sort by name.

Disclaimer: These are not supported by the makers of ProPresenter 6. Use at your own risk. Feel free to read the files in a text-editor and check for any obvious problems.  If you decide to go back a standard "clean" install - just remove the files that you added. 


TODO: I'd like to get a bit smarter with the rotation effect and auto-scale any media that is rotated 90 or 270 degrees so that it fits the output.  For now, you have to manually scale it down when rotating 90 or 270 degrees.
