#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Resources
 * @version WindowsRuntime 1.4
 */
class IResourceLoaderStatics4 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IResourceLoaderStatics4
     * @type {Guid}
     */
    static IID => Guid("{9fb36c32-6c8c-4316-962e-909539b5c259}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDefaultPriPath"]

    /**
     * 
     * @param {HSTRING} packageFullName 
     * @returns {HSTRING} 
     */
    GetDefaultPriPath(packageFullName) {
        if(packageFullName is String) {
            pin := HSTRING.Create(packageFullName)
            packageFullName := pin.Value
        }
        packageFullName := packageFullName is Win32Handle ? NumGet(packageFullName, "ptr") : packageFullName

        value := HSTRING()
        result := ComCall(6, this, "ptr", packageFullName, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
