#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Elements of the TfLBBalloonStyle enumeration are used to specify a language bar balloon style.
 * @remarks
 * The following image shows an example of a balloon with the TF_LB_BALLOON_RECO style. 
 * 
 * <img alt="TF_LB_BALLOON_RECO balloon" border="border" src="images/Balloon_RECO.gif"/>
 * The following image shows an example of a balloon with the TF_LB_BALLOON_SHOW style. 
 * 
 * <img alt="TF_LB_BALLOON_SHOW balloon" border="border" src="images/Balloon_SHOW.gif"/>
 * The following image shows an example of a balloon with the TF_LB_BALLOON_MISS style. 
 * 
 * <img alt="TF_LB_BALLOON_MISS balloon" border="border" src="images/Balloon_MISS.gif"/>
 * @see https://learn.microsoft.com/windows/win32/api/ctfutb/ne-ctfutb-tflbballoonstyle
 * @namespace Windows.Win32.UI.TextServices
 */
class TfLBBalloonStyle extends Win32Enum {

    /**
     * This balloon style is used to represent a reconversion operation.
     * Native name: TF_LB_BALLOON_RECO
     * @type {Integer (Int32)}
     */
    static RECO => 0

    /**
     * This is a normal balloon style.
     * Native name: TF_LB_BALLOON_SHOW
     * @type {Integer (Int32)}
     */
    static SHOW => 1

    /**
     * This balloon style is used to indicate that a command was not recognized.
     * Native name: TF_LB_BALLOON_MISS
     * @type {Integer (Int32)}
     */
    static MISS => 2
}
