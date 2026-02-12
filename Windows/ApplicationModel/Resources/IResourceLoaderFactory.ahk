#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\ResourceLoader.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Resources
 * @version WindowsRuntime 1.4
 */
class IResourceLoaderFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IResourceLoaderFactory
     * @type {Guid}
     */
    static IID => Guid("{c33a3603-69dc-4285-a077-d5c0e47ccbe8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateResourceLoaderByName"]

    /**
     * 
     * @param {HSTRING} name 
     * @returns {ResourceLoader} 
     */
    CreateResourceLoaderByName(name) {
        if(name is String) {
            pin := HSTRING.Create(name)
            name := pin.Value
        }
        name := name is Win32Handle ? NumGet(name, "ptr") : name

        result := ComCall(6, this, "ptr", name, "ptr*", &loader := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ResourceLoader(loader)
    }
}
