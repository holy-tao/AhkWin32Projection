#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/mfvirtualcamera/ne-mfvirtualcamera-mfvirtualcameraaccess
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class MFVirtualCameraAccess extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static MFVirtualCameraAccess_CurrentUser => 0

    /**
     * @type {Integer (Int32)}
     */
    static MFVirtualCameraAccess_AllUsers => 1
}
