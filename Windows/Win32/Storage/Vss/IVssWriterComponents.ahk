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

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 0

    /**
     * 
     * @param {Pointer<UInt32>} pcComponents 
     * @returns {HRESULT} 
     */
    GetComponentCount(pcComponents) {
        result := ComCall(0, this, "uint*", pcComponents, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pidInstance 
     * @param {Pointer<Guid>} pidWriter 
     * @returns {HRESULT} 
     */
    GetWriterInfo(pidInstance, pidWriter) {
        result := ComCall(1, this, "ptr", pidInstance, "ptr", pidWriter, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} iComponent 
     * @param {Pointer<IVssComponent>} ppComponent 
     * @returns {HRESULT} 
     */
    GetComponent(iComponent, ppComponent) {
        result := ComCall(2, this, "uint", iComponent, "ptr", ppComponent, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
