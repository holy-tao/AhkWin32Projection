#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * This interface is available for use in the Microsoft Windows 2000, Windows XP, and Windows Server 2003 operating systems.
 * @remarks
 * 
  * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IBDA_IPSinkInfo)</c>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//bdaiface/nn-bdaiface-ibda_ipsinkinfo
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IBDA_IPSinkInfo extends IUnknown{
    /**
     * The interface identifier for IBDA_IPSinkInfo
     * @type {Guid}
     */
    static IID => Guid("{a750108f-492e-4d51-95f7-649b23ff7ad7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<UInt32>} pulcbAddresses 
     * @param {Pointer<Byte>} ppbAddressList 
     * @returns {HRESULT} 
     */
    get_MulticastList(pulcbAddresses, ppbAddressList) {
        result := ComCall(3, this, "uint*", pulcbAddresses, "char*", ppbAddressList, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrBuffer 
     * @returns {HRESULT} 
     */
    get_AdapterIPAddress(pbstrBuffer) {
        result := ComCall(4, this, "ptr", pbstrBuffer, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrBuffer 
     * @returns {HRESULT} 
     */
    get_AdapterDescription(pbstrBuffer) {
        result := ComCall(5, this, "ptr", pbstrBuffer, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
