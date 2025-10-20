#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.RemoteManagement
 * @version v4.0.30319
 */
class IWSManResourceLocatorInternal extends IUnknown{
    /**
     * The interface identifier for IWSManResourceLocatorInternal
     * @type {Guid}
     */
    static IID => Guid("{effaead7-7ec8-4716-b9be-f2e7e9fb4adb}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3
}
