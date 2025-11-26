#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWbemObjectSink.ahk
#Include .\IUnsecuredApartment.ahk

/**
 * Allows client applications to determine whether Unsecapp.exe performs access checks on asynchronous callbacks.
 * @remarks
 * 
 * <b>IWbemUnsecuredApartment</b> is similar to 
 *      <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nn-wbemcli-iunsecuredapartment">IUnsecuredApartment</a>, which also creates a sink in a 
 *      separate process. For more information, see 
 *      <a href="https://docs.microsoft.com/windows/desktop/WmiSdk/performing-access-checks">Performing Access Checks</a>.
 * 
 * 
 * <b>HKEY_LOCAL_MACHINE</b>&#92;<b>SOFTWARE</b>&#92;<b>Microsoft</b>&#92;<b>WBEM</b>&#92;<b>CIMOM</b>&#92;<b>UnsecAppAccessControlDefault</b>
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//wbemcli/nn-wbemcli-iwbemunsecuredapartment
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class IWbemUnsecuredApartment extends IUnsecuredApartment{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWbemUnsecuredApartment
     * @type {Guid}
     */
    static IID => Guid("{31739d04-3471-4cf4-9a7c-57a44ae71956}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 4

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateSinkStub"]

    /**
     * The CreateSinkStub method is similar to the IUnsecuredApartment::CreateObjectStub and creates an object forwarder sink and performs access checks for receiving asynchronous calls from Windows Management.
     * @param {IWbemObjectSink} pSink Pointer to the client's in-process implementation of 
     *       <a href="https://docs.microsoft.com/windows/desktop/WmiSdk/iwbemobjectsink">IWbemObjectSink</a>.
     * @param {Integer} dwFlags 
     * @param {PWSTR} wszReserved Reserved.
     * @returns {IWbemObjectSink} Receives a pointer to a substitute object to be used in asynchronous 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nn-wbemcli-iwbemservices">IWbemServices</a> calls. The user receives an 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> pointer and must call 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> for 
     *       <b>IID_WbemObjectSink</b> before using this object in asynchronous 
     *       <b>IWbemServices</b> calls.
     * @see https://docs.microsoft.com/windows/win32/api//wbemcli/nf-wbemcli-iwbemunsecuredapartment-createsinkstub
     */
    CreateSinkStub(pSink, dwFlags, wszReserved) {
        wszReserved := wszReserved is String ? StrPtr(wszReserved) : wszReserved

        result := ComCall(4, this, "ptr", pSink, "uint", dwFlags, "ptr", wszReserved, "ptr*", &ppStub := 0, "HRESULT")
        return IWbemObjectSink(ppStub)
    }
}
