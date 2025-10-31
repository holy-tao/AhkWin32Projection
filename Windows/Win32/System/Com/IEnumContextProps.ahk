#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUnknown.ahk

/**
 * Provides a mechanism for enumerating the context properties associated with a COM+ object context.
 * @see https://docs.microsoft.com/windows/win32/api//objidl/nn-objidl-ienumcontextprops
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class IEnumContextProps extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEnumContextProps
     * @type {Guid}
     */
    static IID => Guid("{000001c1-0000-0000-c000-000000000046}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Next", "Skip", "Reset", "Clone", "Count"]

    /**
     * 
     * @param {Integer} celt 
     * @param {Pointer<ContextProperty>} pContextProperties 
     * @param {Pointer<Integer>} pceltFetched 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/objidlbase/nf-objidlbase-ienumcontextprops-next
     */
    Next(celt, pContextProperties, pceltFetched) {
        result := ComCall(3, this, "uint", celt, "ptr", pContextProperties, "uint*", pceltFetched, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} celt 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/objidlbase/nf-objidlbase-ienumcontextprops-skip
     */
    Skip(celt) {
        result := ComCall(4, this, "uint", celt, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/objidlbase/nf-objidlbase-ienumcontextprops-reset
     */
    Reset() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IEnumContextProps>} ppEnumContextProps 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/objidlbase/nf-objidlbase-ienumcontextprops-clone
     */
    Clone(ppEnumContextProps) {
        result := ComCall(6, this, "ptr*", ppEnumContextProps, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pcelt 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/objidlbase/nf-objidlbase-ienumcontextprops-count
     */
    Count(pcelt) {
        result := ComCall(7, this, "uint*", pcelt, "HRESULT")
        return result
    }
}
