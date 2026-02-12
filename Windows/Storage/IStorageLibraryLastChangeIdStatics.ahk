#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32ComInterface.ahk
#Include ..\..\Guid.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Storage
 * @version WindowsRuntime 1.4
 */
class IStorageLibraryLastChangeIdStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IStorageLibraryLastChangeIdStatics
     * @type {Guid}
     */
    static IID => Guid("{81a49128-2ca3-5309-b0d1-cf0788e40762}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Unknown"]

    /**
     * @type {Integer} 
     */
    Unknown {
        get => this.get_Unknown()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Unknown() {
        result := ComCall(6, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
