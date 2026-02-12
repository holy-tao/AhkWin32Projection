#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.System.Implementation.FileExplorer
 * @version WindowsRuntime 1.4
 */
class ISysStorageProviderEventReceivedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISysStorageProviderEventReceivedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{e132d1b9-7b9d-5820-9728-4262b5289142}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Json"]

    /**
     * @type {HSTRING} 
     */
    Json {
        get => this.get_Json()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Json() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
