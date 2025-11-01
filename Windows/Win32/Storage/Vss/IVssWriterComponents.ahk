#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Contains methods used to obtain and modify component information.
 * @see https://docs.microsoft.com/windows/win32/api//vswriter/nl-vswriter-ivsswritercomponents
 * @namespace Windows.Win32.Storage.Vss
 * @version v4.0.30319
 */
class IVssWriterComponents extends Win32ComInterface{

    static sizeof => A_PtrSize

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 0

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetComponentCount", "GetWriterInfo", "GetComponent"]

    /**
     * 
     * @param {Pointer<Integer>} pcComponents 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vswriter/nf-vswriter-ivsswritercomponents-getcomponentcount
     */
    GetComponentCount(pcComponents) {
        pcComponentsMarshal := pcComponents is VarRef ? "uint*" : "ptr"

        result := ComCall(0, this, pcComponentsMarshal, pcComponents, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pidInstance 
     * @param {Pointer<Guid>} pidWriter 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vswriter/nf-vswriter-ivsswritercomponents-getwriterinfo
     */
    GetWriterInfo(pidInstance, pidWriter) {
        result := ComCall(1, this, "ptr", pidInstance, "ptr", pidWriter, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} iComponent 
     * @param {Pointer<IVssComponent>} ppComponent 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vswriter/nf-vswriter-ivsswritercomponents-getcomponent
     */
    GetComponent(iComponent, ppComponent) {
        result := ComCall(2, this, "uint", iComponent, "ptr*", ppComponent, "HRESULT")
        return result
    }
}
