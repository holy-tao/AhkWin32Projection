#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\Collections\IMap.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Storage.Search
 * @version WindowsRuntime 1.4
 */
class IStorageFileQueryResult2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IStorageFileQueryResult2
     * @type {Guid}
     */
    static IID => Guid("{4e5db9dd-7141-46c4-8be3-e9dc9e27275c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetMatchingPropertiesWithRanges"]

    /**
     * 
     * @param {StorageFile} file_ 
     * @returns {IMap<HSTRING, IVectorView<TextSegment>>} 
     */
    GetMatchingPropertiesWithRanges(file_) {
        result := ComCall(6, this, "ptr", file_, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IMap((ptr) => HSTRING({ Value: ptr }), IVectorView.Call.Bind(IVectorView, (ptr) => IPropertyValue(ptr).GetTextSegment()), result_)
    }
}
