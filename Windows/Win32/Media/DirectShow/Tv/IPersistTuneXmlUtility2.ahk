#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IPersistTuneXmlUtility.ahk

/**
 * Defines utility methods for serializing tuning requests (objects that implement the ITuneRequest interface) to XML tuning request strings.
 * @remarks
 * 
  * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IPersistTuneXmlUtility2)</c>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//tuner/nn-tuner-ipersisttunexmlutility2
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IPersistTuneXmlUtility2 extends IPersistTuneXmlUtility{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPersistTuneXmlUtility2
     * @type {Guid}
     */
    static IID => Guid("{992e165f-ea24-4b2f-9a1d-009d92120451}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 4

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Serialize"]

    /**
     * 
     * @param {ITuneRequest} piTuneRequest 
     * @param {Pointer<BSTR>} pString 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ipersisttunexmlutility2-serialize
     */
    Serialize(piTuneRequest, pString) {
        result := ComCall(4, this, "ptr", piTuneRequest, "ptr", pString, "HRESULT")
        return result
    }
}
