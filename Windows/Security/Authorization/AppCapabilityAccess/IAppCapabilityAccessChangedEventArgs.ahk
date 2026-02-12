#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Security.Authorization.AppCapabilityAccess
 * @version WindowsRuntime 1.4
 */
class IAppCapabilityAccessChangedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppCapabilityAccessChangedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{0a578d15-bdd7-457e-8cca-6f53bd2e5944}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => []
}
