# ProPresenter6-Shaders
Have you ever wished you could simply rotate one of those pesky videos/images that you sometimes get from mobile phones?.....

Each media effect (Color Invert, Blur, Adjust Color etc) in ProPresenter 6 is actually made up of 3 files which are located in the program folder of ProPresenter 6.  This is true for both the MacOS and Windows versions of ProPresenter 6.

These files, which define each effect, are human readable text files.  Two of the three files are standard GLSL files (.frag and .vert), and the third is proprietry format that descibes the effect name and adjustable parameters (.rvfx).

I have found (much to my surprise and joy) that you can create your own files for new effects and simply copy them to the folder where ProPresenter keeps all it's standard effects files - and ProPresenter will add and use your new effect.

I don't know GLSL at all, but I was able to read the existing effects files and figure out how to add a few effects that I always wished ProPresenter had: Rotation, Scale and Translation of media.  Finally I have a way to rotate those pesky videos and images that from mobile phones in all sorts of wonderful orientations.

The first effect I created was for opacity - I have included that here just for kick really, as I am not sure if there is any valid use for it - other than being a good "Hello World" experience for me getting started in this exercise.

To use one of these effects copy the three files that make the effect to the folder where ProPresenter 6 stores all it's media effects files and then (re)start ProPresenter 6, now right click any slide with a media cue (or any media in the Video/Image bin) and select "Properties" and go to the effects panel where you will see the new effect included in the list of standard effects.

Tips:
* To rotate a phone image/video - you will typically want 90, 180, or 270 degrees - it's more accurate to type this than to use the slider to adjust the angle.
* The scale is done in X and Y as separate controls - make them the same to keep the aspect ratio the same as the original. (Feel free to make them different to fix stretched videos/pictures too!)
* Order matters - you will need to get use to that. The order of operations for the Rotate, Scale Translate effect is the same as it's name: Rotate FIRST, scale the rotated image SECOND and finally translate the result.

So where do I copy the three files for a new custom effect?

The Standard locations for media effect files for ProPresenter 6:

MacOS: /Applications/ProPresenter 6.app/Contents/Frameworks/ssAPI.framework/Versions/A/Resources
Windows: C:\Program Files (x86)\Renewed Vision\ProPresenter 6\shaders

How to remove?
Using these is as simple as copying in the new files. So removing them and "going clean" is just as simple as removing (deleting) any custom shader files you copied.  I have prefixed them all with "Dan*" so they are all listed together when you look at the folder and sort by name.

Disclaimer: These are not supported by the makers of ProPresenter 6. Use at your own risk. Feel free to read the files in a text-editor and check for any obvious problems.  If you decide to go back a standard "clean" install - just remove the files that you added. 
