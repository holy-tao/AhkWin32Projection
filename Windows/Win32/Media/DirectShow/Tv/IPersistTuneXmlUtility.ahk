#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Defines utility methods for deserializing XML tuning requests to objects that expose their IUnknown interfaces.
 * @remarks
 * 
  * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IPersistTuneXmlUtility)</c>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//tuner/nn-tuner-ipersisttunexmlutility
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IPersistTuneXmlUtility extends IUnknown{
    /**
     * The interface identifier for IPersistTuneXmlUtility
     * @type {Guid}
     */
    static IID => Guid("{990237ae-ac11-4614-be8f-dd217a4cb4cb}")

    /**
     * The class identifier for PersistTuneXmlUtility
     * @type {Guid}
     */
    static CLSID => Guid("{e77026b0-b97f-4cbb-b7fb-f4f03ad69f11}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {VARIANT} varValue 
     * @param {Pointer<IUnknown>} ppObject 
     * @returns {HRESULT} 
     */
    Deserialize(varValue, ppObject) {
        result := ComCall(3, this, "ptr", varValue, "ptr", ppObject, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
