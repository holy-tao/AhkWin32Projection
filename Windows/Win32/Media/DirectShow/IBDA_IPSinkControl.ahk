#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * This interface is available for use in the Microsoft Windows 2000, Windows XP, and Windows Server 2003 operating systems.
 * @remarks
 * 
  * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IBDA_IPSinkControl)</c>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//bdaiface/nn-bdaiface-ibda_ipsinkcontrol
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IBDA_IPSinkControl extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBDA_IPSinkControl
     * @type {Guid}
     */
    static IID => Guid("{3f4dc8e2-4050-11d3-8f4b-00c04f7971e2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetMulticastList", "GetAdapterIPAddress"]

    /**
     * 
     * @param {Pointer<Integer>} pulcbSize 
     * @param {Pointer<Pointer<Integer>>} pbBuffer 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_ipsinkcontrol-getmulticastlist
     */
    GetMulticastList(pulcbSize, pbBuffer) {
        pulcbSizeMarshal := pulcbSize is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, pulcbSizeMarshal, pulcbSize, "ptr*", pbBuffer, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pulcbSize 
     * @param {Pointer<Pointer<Integer>>} pbBuffer 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_ipsinkcontrol-getadapteripaddress
     */
    GetAdapterIPAddress(pulcbSize, pbBuffer) {
        pulcbSizeMarshal := pulcbSize is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, pulcbSizeMarshal, pulcbSize, "ptr*", pbBuffer, "HRESULT")
        return result
    }
}
