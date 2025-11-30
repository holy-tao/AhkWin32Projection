#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The DMO_REGISTER_FLAGS enumeration defines flags that specify registry information for a Microsoft DirectX Media Object (DMO).
 * @remarks
 * 
 * A software key enables the developer of a DMO to control who uses the DMO. If a DMO has a software key, applications must unlock the DMO to use it. The method for unlocking the DMO depends on the implementation. Consult the documentation for the particular DMO.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//dmoreg/ne-dmoreg-dmo_register_flags
 * @namespace Windows.Win32.Media.DxMediaObjects
 * @version v4.0.30319
 */
class DMO_REGISTER_FLAGS extends Win32Enum{

    /**
     * Use of the DMO is restricted by a software key.
     * @type {Integer (Int32)}
     */
    static DMO_REGISTERF_IS_KEYED => 1
}
