#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IDvbServiceDescriptor.ahk

/**
 * Implements methods that get the string values from fields in a Digital Video Broadcast (DVB) service descriptor. The service descriptor describes the service type, and provides the names of the service provider and the service in text form.
 * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nn-dvbsiparser-idvbservicedescriptor2
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IDvbServiceDescriptor2 extends IDvbServiceDescriptor{
    /**
     * The interface identifier for IDvbServiceDescriptor2
     * @type {Guid}
     */
    static IID => Guid("{d6c76506-85ab-487c-9b2b-36416511e4a2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 11

    /**
     * 
     * @param {Integer} convMode 
     * @param {Pointer<BSTR>} pbstrName 
     * @returns {HRESULT} 
     */
    GetServiceProviderNameW(convMode, pbstrName) {
        result := ComCall(11, this, "int", convMode, "ptr", pbstrName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} convMode 
     * @param {Pointer<BSTR>} pbstrName 
     * @returns {HRESULT} 
     */
    GetServiceNameW(convMode, pbstrName) {
        result := ComCall(12, this, "int", convMode, "ptr", pbstrName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
