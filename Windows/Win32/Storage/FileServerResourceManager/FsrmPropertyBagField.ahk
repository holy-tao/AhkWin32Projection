#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Describes the type of property bag.
 * @see https://learn.microsoft.com/windows/win32/api/fsrmenums/ne-fsrmenums-fsrmpropertybagfield
 * @namespace Windows.Win32.Storage.FileServerResourceManager
 * @version v4.0.30319
 */
class FsrmPropertyBagField extends Win32Enum{

    /**
     * Indicates if the property bag should include the name of the volume being accessed, which may be a 
     *       snapshot.
     * @type {Integer (Int32)}
     */
    static FsrmPropertyBagField_AccessVolume => 0

    /**
     * Indicates if the property bag should include the volume <b>GUID</b> name of the 
     *       original volume.
     * @type {Integer (Int32)}
     */
    static FsrmPropertyBagField_VolumeGuidName => 1
}
