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
     * This method is not implemented in the current release. It was created to make the IPersistTuneXml interface compatible with the IPersistStreamInit interface and is reserved for future use.
     * @returns {HRESULT} Always returns <b>S_OK</b>.
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-ipersisttunexml-initnew
     */
    InitNew() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * Deserializes a tuning model object from an XML node.
     * @param {VARIANT} varValue XML node used to deserialize the object. This parameter can be either a <b>BSTR</b> object or an <b>IXMLDOMNode</b> object.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-ipersisttunexml-load
     */
    Load(varValue) {
        result := ComCall(5, this, "ptr", varValue, "HRESULT")
        return result
    }

    /**
     * Serializes a tuning model object to an XML node.
     * @returns {VARIANT} Pointer to an <b>IXMLDOMNode</b> object that gets the data for the tuning model object.
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-ipersisttunexml-save
     */
    Save() {
        pvarFragment := VARIANT()
        result := ComCall(6, this, "ptr", pvarFragment, "HRESULT")
        return pvarFragment
    }
}
