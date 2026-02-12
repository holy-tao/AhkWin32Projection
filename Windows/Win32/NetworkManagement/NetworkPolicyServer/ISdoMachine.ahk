#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IUnknown.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * Use the ISdoMachine interface to attach to an SDO computer, obtain information about the SDO computer, and obtain interfaces to other SDO objects.
 * @see https://learn.microsoft.com/windows/win32/api//content/sdoias/nn-sdoias-isdomachine
 * @namespace Windows.Win32.NetworkManagement.NetworkPolicyServer
 * @version v4.0.30319
 */
class ISdoMachine extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISdoMachine
     * @type {Guid}
     */
    static IID => Guid("{479f6e75-49a2-11d2-8eca-00c04fc2f519}")

    /**
     * The class identifier for SdoMachine
     * @type {Guid}
     */
    static CLSID => Guid("{e9218ae7-9e91-11d1-bf60-0080c7846bc0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Attach", "GetDictionarySDO", "GetServiceSDO", "GetUserSDO", "GetOSType", "GetDomainType", "IsDirectoryAvailable", "GetAttachedComputer", "GetSDOSchema"]

    /**
     * The Attach method attaches to an SDO computer. Attaching to an SDO computer is the first step is using the SDO API to administer that computer.
     * @remarks
     * Use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/sdoias/nf-sdoias-isdomachine-getattachedcomputer">ISdoMachine::GetAttachedComputer</a> method to determine if a computer is already attached.
     * @param {BSTR} bstrComputerName Specifies a 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/automat/bstr">BSTR</a> variable that contains the name of the computer to which to attach. If this parameter specifies a <b>NULL</b> string, the local computer is attached.
     * @returns {HRESULT} If the method succeeds the return value is <b>S_OK</b>.
     * 
     * If a computer is already attached, the return value is <b>E_FAIL</b>.
     * 
     * The method may also return one of the following error codes.
     * @see https://learn.microsoft.com/windows/win32/api//content/sdoias/nf-sdoias-isdomachine-attach
     */
    Attach(bstrComputerName) {
        if(bstrComputerName is String) {
            pin := BSTR.Alloc(bstrComputerName)
            bstrComputerName := pin.Value
        }

        result := ComCall(7, this, "ptr", bstrComputerName, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The GetDictionarySDO method retrieves an interface for an attribute-dictionary SDO.
     * @remarks
     * Before calling this method, use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/sdoias/nf-sdoias-isdomachine-attach">ISdoMachine::Attach</a> method to attach to the SDO computer.
     * @returns {IUnknown} Pointer to an ISdoDictionary.
     * @see https://learn.microsoft.com/windows/win32/api//content/sdoias/nf-sdoias-isdomachine-getdictionarysdo
     */
    GetDictionarySDO() {
        result := ComCall(8, this, "ptr*", &ppDictionarySDO := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IUnknown(ppDictionarySDO)
    }

    /**
     * The GetServiceSDO method retrieves a Server Data Object (SDO) for the specified service.
     * @remarks
     * Before calling this method, use the 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/sdoias/nf-sdoias-isdomachine-attach">ISdoMachine::Attach</a> method to attach to the SDO 
     *     computer.
     * 
     * None of the parameters for this method can be <b>NULL</b>.
     * @param {Integer} eDataStore Specifies a value from the <a href="https://docs.microsoft.com/windows/desktop/api/sdoias/ne-sdoias-iasdatastore">IASDATASTORE</a> enumeration 
     *       type.
     * @param {BSTR} bstrServiceName Specifies a 
     *       <a href="https://docs.microsoft.com/previous-versions/windows/desktop/automat/bstr">BSTR</a> that contains the service
     * @returns {IUnknown} Pointer to a pointer that points to an <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface 
     *       pointer. Use the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> method of this 
     *       <b>IUnknown</b> interface to obtain an 
     *       <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nn-oaidl-idispatch">IDispatch</a> interface for the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/sdoias/nn-sdoias-isdoservicecontrol">ISdoServiceControl</a> object.
     * @see https://learn.microsoft.com/windows/win32/api//content/sdoias/nf-sdoias-isdomachine-getservicesdo
     */
    GetServiceSDO(eDataStore, bstrServiceName) {
        if(bstrServiceName is String) {
            pin := BSTR.Alloc(bstrServiceName)
            bstrServiceName := pin.Value
        }

        result := ComCall(9, this, "int", eDataStore, "ptr", bstrServiceName, "ptr*", &ppServiceSDO := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IUnknown(ppServiceSDO)
    }

    /**
     * The GetUserSDO method retrieves an interface to the Server Data Object (SDO) for the specified user.
     * @remarks
     * Before calling this method, use the 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/sdoias/nf-sdoias-isdomachine-attach">ISdoMachine::Attach</a> method to attach to the SDO 
     *     computer.
     * 
     * If the SDO computer has a directory, then the 
     *     <b>ISdoMachine::GetUserSDO</b> automatically uses the 
     *     <b>DATA_STORE_DIRECTORY</b> value of 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/sdoias/ne-sdoias-iasdatastore">IASDATASTORE</a> instead of 
     *     <b>DATA_STORE_LOCAL</b>.
     * 
     * None of the parameters can be <b>NULL</b>.
     * @param {Integer} eDataStore Specifies a value from the <a href="https://docs.microsoft.com/windows/desktop/api/sdoias/ne-sdoias-iasdatastore">IASDATASTORE</a> enumeration 
     *       type.
     * @param {BSTR} bstrUserName Specifies a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/automat/bstr">BSTR</a> that contains 
     *       the name of the user. The name can be in Lightweight Directory Access Protocol (LDAP) format, or in Security 
     *       Accounts Manager (SAM) format.
     * @returns {IUnknown} Pointer to a pointer that points to an <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface 
     *       pointer. Use the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> method of this 
     *       <b>IUnknown</b> interface to obtain an 
     *       <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nn-oaidl-idispatch">IDispatch</a> interface to an 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/sdoias/nn-sdoias-isdo">ISdo</a> object for the specified user.
     * @see https://learn.microsoft.com/windows/win32/api//content/sdoias/nf-sdoias-isdomachine-getusersdo
     */
    GetUserSDO(eDataStore, bstrUserName) {
        if(bstrUserName is String) {
            pin := BSTR.Alloc(bstrUserName)
            bstrUserName := pin.Value
        }

        result := ComCall(10, this, "int", eDataStore, "ptr", bstrUserName, "ptr*", &ppUserSDO := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IUnknown(ppUserSDO)
    }

    /**
     * The GetOSType method retrieves the type of operating system running on the SDO computer.
     * @remarks
     * Before calling this method, use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/sdoias/nf-sdoias-isdomachine-attach">ISdoMachine::Attach</a> method to attach to the SDO computer.
     * @returns {Integer} Pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/sdoias/ne-sdoias-iasostype">IASOSTYPE</a> variable that receives the type of the operating system on the SDO computer.
     * @see https://learn.microsoft.com/windows/win32/api//content/sdoias/nf-sdoias-isdomachine-getostype
     */
    GetOSType() {
        result := ComCall(11, this, "int*", &eOSType := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return eOSType
    }

    /**
     * The GetDomainType retrieves the type of domain in which the SDO computer resides.
     * @remarks
     * Before calling this method, use the 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/sdoias/nf-sdoias-isdomachine-attach">ISdoMachine::Attach</a> method to attach to the SDO 
     *     computer.
     * @returns {Integer} Pointer to an <a href="https://docs.microsoft.com/windows/win32/api/sdoias/ne-sdoias-iasdomaintype">IASDOMAINTYPE</a> variable that receives 
     *       the type of the domain in which the SDO computer resides.
     * @see https://learn.microsoft.com/windows/win32/api//content/sdoias/nf-sdoias-isdomachine-getdomaintype
     */
    GetDomainType() {
        result := ComCall(12, this, "int*", &eDomainType := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return eDomainType
    }

    /**
     * The IsDirectoryAvailable method tests whether an Active Directory service is available on the SDO computer.
     * @remarks
     * Before calling this method, use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/sdoias/nf-sdoias-isdomachine-attach">ISdoMachine::Attach</a> method to attach to the SDO computer.
     * 
     * <div class="alert"><b>Important</b>  Always returns <b>VARIANT_FALSE</b> in the current implementation.</div>
     * <div> </div>
     * @returns {VARIANT_BOOL} Specifies whether the Active Directory is available. If the Active Directory is available, this parameter is <b>TRUE</b>. Otherwise, it is <b>FALSE</b>.
     * @see https://learn.microsoft.com/windows/win32/api//content/sdoias/nf-sdoias-isdomachine-isdirectoryavailable
     */
    IsDirectoryAvailable() {
        result := ComCall(13, this, "short*", &boolDirectoryAvailable := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return boolDirectoryAvailable
    }

    /**
     * The GetAttachedComputer method retrieves the name of the computer that is currently attached as an SDO computer.
     * @remarks
     * The <b>GetAttachedComputer</b> allocates 
     *     the memory for the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/automat/bstr">BSTR</a> 
     *     variable. The calling application should free this memory by calling 
     *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysfreestring">SysFreeString</a>.
     * @returns {BSTR} Pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/automat/bstr">BSTR</a> that 
     *       receives the name of the computer that is the currently-attached SDO computer.
     * @see https://learn.microsoft.com/windows/win32/api//content/sdoias/nf-sdoias-isdomachine-getattachedcomputer
     */
    GetAttachedComputer() {
        bstrComputerName := BSTR()
        result := ComCall(14, this, "ptr", bstrComputerName, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return bstrComputerName
    }

    /**
     * 
     * @returns {IUnknown} 
     */
    GetSDOSchema() {
        result := ComCall(15, this, "ptr*", &ppSDOSchema := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IUnknown(ppSDOSchema)
    }
}
