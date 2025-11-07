#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Variant\VARIANT.ahk
#Include ..\..\..\System\Com\IPersist.ahk

/**
 * Implements methods for serializing tuning model objects. All serializable tuning model objects are required to implement this interface.
 * @remarks
 * 
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IPersistTuneXml)</c>.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//tuner/nn-tuner-ipersisttunexml
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IPersistTuneXml extends IPersist{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPersistTuneXml
     * @type {Guid}
     */
    static IID => Guid("{0754cd31-8d15-47a9-8215-d20064157244}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 4

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["InitNew", "Load", "Save"]

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ipersisttunexml-initnew
     */
    InitNew() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} varValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ipersisttunexml-load
     */
    Load(varValue) {
        result := ComCall(5, this, "ptr", varValue, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ipersisttunexml-save
     */
    Save() {
        pvarFragment := VARIANT()
        result := ComCall(6, this, "ptr", pvarFragment, "HRESULT")
        return pvarFragment
    }
}
