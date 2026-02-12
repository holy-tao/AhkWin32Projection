#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Import
 * @version WindowsRuntime 1.4
 */
class IPhotoImportSelectionChangedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPhotoImportSelectionChangedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{10461782-fa9d-4c30-8bc9-4d64911572d5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_IsSelectionEmpty"]

    /**
     * @type {Boolean} 
     */
    IsSelectionEmpty {
        get => this.get_IsSelectionEmpty()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsSelectionEmpty() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
