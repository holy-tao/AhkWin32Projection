#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Used by SHGetStockIconInfo to identify which stock system icon to retrieve.
 * @remarks
 * 
 * SIID_INVALID, with a value of -1, indicates an invalid **SHSTOCKICONID** value.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//shellapi/ne-shellapi-shstockiconid
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class SHSTOCKICONID extends Win32Enum{

    /**
     * :::image type="icon" source="./images/SIID_DOCNOASSOC.png":::
     *  Document of a type with no associated application.
     * @type {Integer (Int32)}
     */
    static SIID_DOCNOASSOC => 0

    /**
     * :::image type="icon" source="./images/SIID_DOCASSOC.jpg":::
     *  Document of a type with an associated application.
     * @type {Integer (Int32)}
     */
    static SIID_DOCASSOC => 1

    /**
     * :::image type="icon" source="./images/SIID_APPLICATION.jpg":::
     *  Generic application with no custom icon.
     * @type {Integer (Int32)}
     */
    static SIID_APPLICATION => 2

    /**
     * :::image type="icon" source="./images/SIID_FOLDER.jpg":::
     *  Folder (generic, unspecified state).
     * @type {Integer (Int32)}
     */
    static SIID_FOLDER => 3

    /**
     * :::image type="icon" source="./images/SIID_FOLDEROPEN.jpg":::
     *  Folder (open).
     * @type {Integer (Int32)}
     */
    static SIID_FOLDEROPEN => 4

    /**
     * :::image type="icon" source="./images/SIID_DRIVE525.jpg":::
     *  5.25-inch disk drive.
     * @type {Integer (Int32)}
     */
    static SIID_DRIVE525 => 5

    /**
     * :::image type="icon" source="./images/SIID_DRIVE35.jpg":::
     *  3.5-inch disk drive.
     * @type {Integer (Int32)}
     */
    static SIID_DRIVE35 => 6

    /**
     * :::image type="icon" source="./images/SIID_DRIVEREMOVE.png":::
     *  Removable drive.
     * @type {Integer (Int32)}
     */
    static SIID_DRIVEREMOVE => 7

    /**
     * :::image type="icon" source="./images/SIID_DRIVEFIXED.jpg":::
     *  Fixed drive (hard disk).
     * @type {Integer (Int32)}
     */
    static SIID_DRIVEFIXED => 8

    /**
     * :::image type="icon" source="./images/SIID_DRIVENET.jpg":::
     *  Network drive (connected).
     * @type {Integer (Int32)}
     */
    static SIID_DRIVENET => 9

    /**
     * :::image type="icon" source="./images/SIID_DRIVENETDISABLED.jpg":::
     *  Network drive (disconnected).
     * @type {Integer (Int32)}
     */
    static SIID_DRIVENETDISABLED => 10

    /**
     * :::image type="icon" source="./images/SIID_DRIVECD.jpg":::
     *  CD drive.
     * @type {Integer (Int32)}
     */
    static SIID_DRIVECD => 11

    /**
     * :::image type="icon" source="./images/SIID_DRIVERAM.jpg":::
     *  RAM disk drive.
     * @type {Integer (Int32)}
     */
    static SIID_DRIVERAM => 12

    /**
     * :::image type="icon" source="./images/SIID_WORLD.jpg":::
     *  The entire network.
     * @type {Integer (Int32)}
     */
    static SIID_WORLD => 13

    /**
     * :::image type="icon" source="./images/SIID_SERVER.jpg":::
     *  A computer on the network.
     * @type {Integer (Int32)}
     */
    static SIID_SERVER => 15

    /**
     * :::image type="icon" source="./images/SIID_PRINTER.jpg":::
     *  A local printer or print destination.
     * @type {Integer (Int32)}
     */
    static SIID_PRINTER => 16

    /**
     * :::image type="icon" source="./images/SIID_MYNETWORK.jpg":::
     *  The **Network** virtual folder (<a href="https://docs.microsoft.com/windows/desktop/shell/knownfolderid">FOLDERID_NetworkFolder</a>/<a href="https://docs.microsoft.com/windows/desktop/shell/csidl">CSIDL_NETWORK</a>).
     * @type {Integer (Int32)}
     */
    static SIID_MYNETWORK => 17

    /**
     * :::image type="icon" source="./images/SIID_FIND.jpg":::
     *  The **Search** feature.
     * @type {Integer (Int32)}
     */
    static SIID_FIND => 22

    /**
     * :::image type="icon" source="./images/SIID_HELP.jpg":::
     *  The **Help and Support** feature.
     * @type {Integer (Int32)}
     */
    static SIID_HELP => 23

    /**
     * :::image type="icon" source="./images/SIID_SHARE.jpg":::
     *  Overlay for a shared item.
     * @type {Integer (Int32)}
     */
    static SIID_SHARE => 28

    /**
     * :::image type="icon" source="./images/SIID_LINK.jpg":::
     *  Overlay for a shortcut.
     * @type {Integer (Int32)}
     */
    static SIID_LINK => 29

    /**
     * :::image type="icon" source="./images/SIID_SLOWFILE.png":::
     *  Overlay for items that are expected to be slow to access.
     * @type {Integer (Int32)}
     */
    static SIID_SLOWFILE => 30

    /**
     * :::image type="icon" source="./images/SIID_RECYCLER.jpg":::
     *  The Recycle Bin (empty).
     * @type {Integer (Int32)}
     */
    static SIID_RECYCLER => 31

    /**
     * :::image type="icon" source="./images/SIID_RECYCLERFULL.jpg":::
     *  The Recycle Bin (not empty).
     * @type {Integer (Int32)}
     */
    static SIID_RECYCLERFULL => 32

    /**
     * :::image type="icon" source="./images/SIID_MEDIACDAUDIO.jpg":::
     *  Audio CD media.
     * @type {Integer (Int32)}
     */
    static SIID_MEDIACDAUDIO => 40

    /**
     * :::image type="icon" source="./images/SIID_LOCK.jpg":::
     *  Security lock.
     * @type {Integer (Int32)}
     */
    static SIID_LOCK => 47

    /**
     * :::image type="icon" source="./images/SIID_AUTOLIST.jpg":::
     *  A virtual folder that contains the results of a search.
     * @type {Integer (Int32)}
     */
    static SIID_AUTOLIST => 49

    /**
     * :::image type="icon" source="./images/SIID_PRINTERNET.jpg":::
     *  A network printer.
     * @type {Integer (Int32)}
     */
    static SIID_PRINTERNET => 50

    /**
     * :::image type="icon" source="./images/SIID_SERVERSHARE.jpg":::
     *  A server shared on a network.
     * @type {Integer (Int32)}
     */
    static SIID_SERVERSHARE => 51

    /**
     * :::image type="icon" source="./images/SIID_PRINTERFAX.jpg":::
     *  A local fax printer.
     * @type {Integer (Int32)}
     */
    static SIID_PRINTERFAX => 52

    /**
     * :::image type="icon" source="./images/SIID_PRINTERFAXNET.jpg":::
     *  A network fax printer.
     * @type {Integer (Int32)}
     */
    static SIID_PRINTERFAXNET => 53

    /**
     * :::image type="icon" source="./images/SIID_PRINTERFILE.jpg":::
     *  A file that receives the output of a **Print to file** operation.
     * @type {Integer (Int32)}
     */
    static SIID_PRINTERFILE => 54

    /**
     * :::image type="icon" source="./images/SIID_STACK.jpg":::
     *  A category that results from a **Stack by** command to organize the contents of a folder.
     * @type {Integer (Int32)}
     */
    static SIID_STACK => 55

    /**
     * :::image type="icon" source="./images/SIID_MEDIASVCD.jpg":::
     *  Super Video CD (SVCD) media.
     * @type {Integer (Int32)}
     */
    static SIID_MEDIASVCD => 56

    /**
     * :::image type="icon" source="./images/SIID_STUFFEDFOLDER.jpg":::
     *  A folder that contains only subfolders as child items.
     * @type {Integer (Int32)}
     */
    static SIID_STUFFEDFOLDER => 57

    /**
     * :::image type="icon" source="./images/SIID_DRIVEUNKNOWN.jpg":::
     *  Unknown drive type.
     * @type {Integer (Int32)}
     */
    static SIID_DRIVEUNKNOWN => 58

    /**
     * :::image type="icon" source="./images/SIID_DRIVEDVD.jpg":::
     *  DVD drive.
     * @type {Integer (Int32)}
     */
    static SIID_DRIVEDVD => 59

    /**
     * :::image type="icon" source="./images/SIID_MEDIADVD.jpg":::
     *  DVD media.
     * @type {Integer (Int32)}
     */
    static SIID_MEDIADVD => 60

    /**
     * :::image type="icon" source="./images/SIID_MEDIADVDRAM.jpg":::
     *  DVD-RAM media.
     * @type {Integer (Int32)}
     */
    static SIID_MEDIADVDRAM => 61

    /**
     * :::image type="icon" source="./images/SIID_MEDIADVDRW.jpg":::
     *  DVD-RW media.
     * @type {Integer (Int32)}
     */
    static SIID_MEDIADVDRW => 62

    /**
     * :::image type="icon" source="./images/SIID_MEDIADVDR.jpg":::
     *  DVD-R media.
     * @type {Integer (Int32)}
     */
    static SIID_MEDIADVDR => 63

    /**
     * :::image type="icon" source="./images/SIID_MEDIADVDROM.jpg":::
     *  DVD-ROM media.
     * @type {Integer (Int32)}
     */
    static SIID_MEDIADVDROM => 64

    /**
     * :::image type="icon" source="./images/SIID_MEDIACDAUDIOPLUS.jpg":::
     *  CD+ (enhanced audio CD) media.
     * @type {Integer (Int32)}
     */
    static SIID_MEDIACDAUDIOPLUS => 65

    /**
     * :::image type="icon" source="./images/SIID_MEDIACDRW.jpg":::
     *  CD-RW media.
     * @type {Integer (Int32)}
     */
    static SIID_MEDIACDRW => 66

    /**
     * :::image type="icon" source="./images/SIID_MEDIACDR.jpg":::
     *  CD-R media.
     * @type {Integer (Int32)}
     */
    static SIID_MEDIACDR => 67

    /**
     * :::image type="icon" source="./images/SIID_MEDIACDBURN.jpg":::
     *  A writeable CD in the process of being burned.
     * @type {Integer (Int32)}
     */
    static SIID_MEDIACDBURN => 68

    /**
     * :::image type="icon" source="./images/SIID_MEDIABLANKCD.jpg":::
     *  Blank writable CD media.
     * @type {Integer (Int32)}
     */
    static SIID_MEDIABLANKCD => 69

    /**
     * :::image type="icon" source="./images/SIID_MEDIACDROM.jpg":::
     *  CD-ROM media.
     * @type {Integer (Int32)}
     */
    static SIID_MEDIACDROM => 70

    /**
     * :::image type="icon" source="./images/SIID_AUDIOFILES.jpg":::
     *  An audio file.
     * @type {Integer (Int32)}
     */
    static SIID_AUDIOFILES => 71

    /**
     * :::image type="icon" source="./images/SIID_IMAGEFILES.jpg":::
     *  An image file.
     * @type {Integer (Int32)}
     */
    static SIID_IMAGEFILES => 72

    /**
     * :::image type="icon" source="./images/SIID_VIDEOFILES.jpg":::
     *  A video file.
     * @type {Integer (Int32)}
     */
    static SIID_VIDEOFILES => 73

    /**
     * :::image type="icon" source="./images/SIID_MIXEDFILES.jpg":::
     *  A mixed file.
     * @type {Integer (Int32)}
     */
    static SIID_MIXEDFILES => 74

    /**
     * :::image type="icon" source="./images/SIID_FOLDERBACK.jpg":::
     *  Folder back.
     * @type {Integer (Int32)}
     */
    static SIID_FOLDERBACK => 75

    /**
     * :::image type="icon" source="./images/SIID_FOLDERFRONT.jpg":::
     *  Folder front.
     * @type {Integer (Int32)}
     */
    static SIID_FOLDERFRONT => 76

    /**
     * :::image type="icon" source="./images/SIID_SHIELD.jpg":::
     *  Security shield. Use for UAC prompts only.
     * @type {Integer (Int32)}
     */
    static SIID_SHIELD => 77

    /**
     * :::image type="icon" source="./images/SIID_WARNING.jpg":::
     *  Warning.
     * @type {Integer (Int32)}
     */
    static SIID_WARNING => 78

    /**
     * :::image type="icon" source="./images/SIID_INFO.jpg":::
     *  Informational.
     * @type {Integer (Int32)}
     */
    static SIID_INFO => 79

    /**
     * :::image type="icon" source="./images/SIID_ERROR.jpg":::
     *  Error.
     * @type {Integer (Int32)}
     */
    static SIID_ERROR => 80

    /**
     * :::image type="icon" source="./images/SIID_KEY.jpg":::
     *  Key.
     * @type {Integer (Int32)}
     */
    static SIID_KEY => 81

    /**
     * :::image type="icon" source="./images/SIID_SOFTWARE.jpg":::
     *  Software.
     * @type {Integer (Int32)}
     */
    static SIID_SOFTWARE => 82

    /**
     * :::image type="icon" source="./images/SIID_RENAME.jpg":::
     *  A UI item, such as a button, that issues a rename command.
     * @type {Integer (Int32)}
     */
    static SIID_RENAME => 83

    /**
     * :::image type="icon" source="./images/SIID_DELETE.jpg":::
     *  A UI item, such as a button, that issues a delete command.
     * @type {Integer (Int32)}
     */
    static SIID_DELETE => 84

    /**
     * :::image type="icon" source="./images/SIID_MEDIAAUDIODVD.jpg":::
     *  Audio DVD media.
     * @type {Integer (Int32)}
     */
    static SIID_MEDIAAUDIODVD => 85

    /**
     * :::image type="icon" source="./images/SIID_MEDIAMOVIEDVD.jpg":::
     *  Movie DVD media.
     * @type {Integer (Int32)}
     */
    static SIID_MEDIAMOVIEDVD => 86

    /**
     * :::image type="icon" source="./images/SIID_MEDIAENHANCEDCD.jpg":::
     *  Enhanced CD media.
     * @type {Integer (Int32)}
     */
    static SIID_MEDIAENHANCEDCD => 87

    /**
     * :::image type="icon" source="./images/SIID_MEDIAENHANCEDDVD.jpg":::
     *  Enhanced DVD media.
     * @type {Integer (Int32)}
     */
    static SIID_MEDIAENHANCEDDVD => 88

    /**
     * :::image type="icon" source="./images/SIID_MEDIAHDDVD.jpg":::
     *  High definition DVD media in the HD DVD format.
     * @type {Integer (Int32)}
     */
    static SIID_MEDIAHDDVD => 89

    /**
     * :::image type="icon" source="./images/SIID_MEDIABLURAY.jpg":::
     *  High definition DVD media in the Blu-ray Disc™ format.
     * @type {Integer (Int32)}
     */
    static SIID_MEDIABLURAY => 90

    /**
     * :::image type="icon" source="./images/SIID_MEDIAVCD.jpg":::
     *  Video CD (VCD) media.
     * @type {Integer (Int32)}
     */
    static SIID_MEDIAVCD => 91

    /**
     * :::image type="icon" source="./images/SIID_MEDIADVDPLUSR.jpg":::
     *  DVD+R media.
     * @type {Integer (Int32)}
     */
    static SIID_MEDIADVDPLUSR => 92

    /**
     * :::image type="icon" source="./images/SIID_MEDIADVDPLUSRW.jpg":::
     *  DVD+RW media.
     * @type {Integer (Int32)}
     */
    static SIID_MEDIADVDPLUSRW => 93

    /**
     * :::image type="icon" source="./images/SIID_DESKTOPPC.jpg":::
     *  A desktop computer.
     * @type {Integer (Int32)}
     */
    static SIID_DESKTOPPC => 94

    /**
     * :::image type="icon" source="./images/SIID_MOBILEPC.jpg":::
     *  A mobile computer (laptop).
     * @type {Integer (Int32)}
     */
    static SIID_MOBILEPC => 95

    /**
     * :::image type="icon" source="./images/SIID_USERS.jpg":::
     *  The **User Accounts** Control Panel item.
     * @type {Integer (Int32)}
     */
    static SIID_USERS => 96

    /**
     * :::image type="icon" source="./images/SIID_MEDIASMARTMEDIA.jpg":::
     *  Smart media.
     * @type {Integer (Int32)}
     */
    static SIID_MEDIASMARTMEDIA => 97

    /**
     * :::image type="icon" source="./images/SIID_MEDIACOMPACTFLASH.jpg":::
     *  CompactFlash media.
     * @type {Integer (Int32)}
     */
    static SIID_MEDIACOMPACTFLASH => 98

    /**
     * :::image type="icon" source="./images/SIID_DEVICECELLPHONE.jpg":::
     *  A cell phone.
     * @type {Integer (Int32)}
     */
    static SIID_DEVICECELLPHONE => 99

    /**
     * :::image type="icon" source="./images/SIID_DEVICECAMERA.jpg":::
     *  A digital camera.
     * @type {Integer (Int32)}
     */
    static SIID_DEVICECAMERA => 100

    /**
     * :::image type="icon" source="./images/SIID_DEVICEVIDEOCAMERA.jpg":::
     *  A digital video camera.
     * @type {Integer (Int32)}
     */
    static SIID_DEVICEVIDEOCAMERA => 101

    /**
     * :::image type="icon" source="./images/SIID_DEVICEAUDIOPLAYER.jpg":::
     *  An audio player.
     * @type {Integer (Int32)}
     */
    static SIID_DEVICEAUDIOPLAYER => 102

    /**
     * :::image type="icon" source="./images/SIID_NETWORKCONNECT.jpg":::
     *  Connect to network.
     * @type {Integer (Int32)}
     */
    static SIID_NETWORKCONNECT => 103

    /**
     * :::image type="icon" source="./images/SIID_INTERNET.jpg":::
     *  The **Network and Internet** Control Panel item.
     * @type {Integer (Int32)}
     */
    static SIID_INTERNET => 104

    /**
     * :::image type="icon" source="./images/SIID_ZIPFILE.jpg":::
     *  A compressed file with a .zip file name extension.
     * @type {Integer (Int32)}
     */
    static SIID_ZIPFILE => 105

    /**
     * :::image type="icon" source="./images/SIID_SETTINGS.jpg":::
     *  The **Additional Options** Control Panel item.
     * @type {Integer (Int32)}
     */
    static SIID_SETTINGS => 106

    /**
     * :::image type="icon" source="./images/SIID_DRIVEHDDVD.jpg":::
     * **Windows Vista with Service Pack 1 (SP1) and later**. High definition DVD drive (any type - HD DVD-ROM, HD DVD-R, HD-DVD-RAM) that uses the HD DVD format.
     * @type {Integer (Int32)}
     */
    static SIID_DRIVEHDDVD => 132

    /**
     * :::image type="icon" source="./images/SIID_DRIVEBD.jpg":::
     * **Windows Vista with SP1 and later**. High definition DVD drive (any type - BD-ROM, BD-R, BD-RE) that uses the Blu-ray Disc format.
     * @type {Integer (Int32)}
     */
    static SIID_DRIVEBD => 133

    /**
     * :::image type="icon" source="./images/SIID_MEDIAHDDVDROM.jpg":::
     * **Windows Vista with SP1 and later**. High definition DVD-ROM media in the HD DVD-ROM format.
     * @type {Integer (Int32)}
     */
    static SIID_MEDIAHDDVDROM => 134

    /**
     * :::image type="icon" source="./images/SIID_MEDIAHDDVDR.jpg":::
     * **Windows Vista with SP1 and later**. High definition DVD-R media in the HD DVD-R format.
     * @type {Integer (Int32)}
     */
    static SIID_MEDIAHDDVDR => 135

    /**
     * :::image type="icon" source="./images/SIID_MEDIAHDDVDRAM.jpg":::
     * **Windows Vista with SP1 and later**. High definition DVD-RAM media in the HD DVD-RAM format.
     * @type {Integer (Int32)}
     */
    static SIID_MEDIAHDDVDRAM => 136

    /**
     * :::image type="icon" source="./images/SIID_MEDIABDROM.jpg":::
     * **Windows Vista with SP1 and later**. High definition DVD-ROM media in the Blu-ray Disc BD-ROM format.
     * @type {Integer (Int32)}
     */
    static SIID_MEDIABDROM => 137

    /**
     * :::image type="icon" source="./images/SIID_MEDIABDR.jpg":::
     * **Windows Vista with SP1 and later**. High definition write-once media in the Blu-ray Disc BD-R format.
     * @type {Integer (Int32)}
     */
    static SIID_MEDIABDR => 138

    /**
     * :::image type="icon" source="./images/SIID_MEDIABDRE.jpg":::
     * **Windows Vista with SP1 and later**. High definition read/write media in the Blu-ray Disc BD-RE format.
     * @type {Integer (Int32)}
     */
    static SIID_MEDIABDRE => 139

    /**
     * :::image type="icon" source="./images/SIID_CLUSTEREDDRIVE.jpg":::
     * **Windows Vista with SP1 and later**. A cluster disk array.
     * @type {Integer (Int32)}
     */
    static SIID_CLUSTEREDDRIVE => 140

    /**
     * The highest valid value in the enumeration. Values over 160 are Windows 7-only icons.
     * @type {Integer (Int32)}
     */
    static SIID_MAX_ICONS => 181
}
