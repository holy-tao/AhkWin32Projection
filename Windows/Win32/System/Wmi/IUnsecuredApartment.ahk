#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * The IUnsecuredApartment interface is used to simplify the process of making asynchronous calls from a client process.
 * @remarks
 * 
  * <b>IUnsecuredApartment</b> allows WMI to create a separate process to handle callbacks. Using this interface creates security risks, as described in <a href="https://docs.microsoft.com/windows/desktop/WmiSdk/setting-security-on-an-asynchronous-call">Setting Security on an Asynchronous Call</a>. Semisynchronous access or performing access checks are recommended instead of asynchronous calls. For more information and an example of using <b>IUnsecuredApartment</b>, see <a href="https://docs.microsoft.com/windows/desktop/WmiSdk/lowering-the-security-for-a-sink-in-a-separate-process">Lowering the Security for a Sink in a Separate Process</a>. Use <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nn-wbemcli-iwbemunsecuredapartment">IWbemUnsecuredApartment::CreateSinkStub</a> for a more secure approach.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//wbemcli/nn-wbemcli-iunsecuredapartment
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class IUnsecuredApartment extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUnsecuredApartment
     * @type {Guid}
     */
    static IID => Guid("{1cfaba8c-1523-11d1-ad79-00c04fd8fdff}")

    /**
     * The class identifier for UnsecuredApartment
     * @type {Guid}
     */
    static CLSID => Guid("{49bd2028-1523-11d1-ad79-00c04fd8fdff}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateObjectStub"]

    /**
     * 
     * @param {IUnknown} pObject 
     * @returns {IUnknown} 
     * @see https://learn.microsoft.com/windows/win32/api/wbemcli/nf-wbemcli-iunsecuredapartment-createobjectstub
     */
    CreateObjectStub(pObject) {
        result := ComCall(3, this, "ptr", pObject, "ptr*", &ppStub := 0, "HRESULT")
        return IUnknown(ppStub)
    }
}
