#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IADs.ahk

/**
 * The IADsUser interface is a dual interface that inherits from IADs.
 * @remarks
 * 
  * As with any other ADSI object, the container object creates a Windows user account object. First, bind to a container object. Then, call the  <a href="https://docs.microsoft.com/windows/desktop/api/iads/nf-iads-iadscontainer-create">IADsContainer::Create</a> method and specify mandatory or optional attributes.
  * 
  * With WinNT, you do not have to specify any additional attributes when creating a user. You may call the <a href="https://docs.microsoft.com/windows/desktop/api/iads/nf-iads-iadscontainer-create">IADsContainer::Create</a> method to create the user object directly.
  * 
  * 
  * ```vb
  * Dim dom As IADsContainer
  * Dim usr As IADsUser
  * 
  * On Error GoTo Cleanup
  * 
  * Set dom = GetObject("WinNT://MyDomain")
  * Set usr = dom.Create("user","jeffsmith")
  * usr.SetInfo
  * 
  * Cleanup:
  *     If(Err.Number<>0) Then
  *         MsgBox("An error has occurred. " & Err.Number)
  *     End If
  *     Set mach = Nothing
  *     Set usr = Nothing
  * 
  * ```
  * 
  * 
  * In this case, a domain user is created with the following default values.
  * 
  * <table>
  * <tr>
  * <th>Property</th>
  * <th>Value</th>
  * </tr>
  * <tr>
  * <td>
  * <b>Full Name</b>
  * 
  * </td>
  * <td>
  * SAM Account Name (such as jeffsmith)
  * 
  * </td>
  * </tr>
  * <tr>
  * <td>
  * <b>Password</b>
  * 
  * </td>
  * <td>
  * Empty
  * 
  * </td>
  * </tr>
  * <tr>
  * <td>
  * <b>User Must Change Password</b>
  * 
  * </td>
  * <td>
  * <b>TRUE</b>
  * 
  * </td>
  * </tr>
  * <tr>
  * <td>
  * <b>User Cannot Change Password</b>
  * 
  * </td>
  * <td>
  * <b>FALSE</b>
  * 
  * </td>
  * </tr>
  * <tr>
  * <td>
  * <b>Password Never Expires</b>
  * 
  * </td>
  * <td>
  * <b>FALSE</b>
  * 
  * </td>
  * </tr>
  * <tr>
  * <td>
  * <b>Account Disabled</b>
  * 
  * </td>
  * <td>
  * <b>FALSE</b>
  * 
  * </td>
  * </tr>
  * <tr>
  * <td>
  * <b>Group</b>
  * 
  * </td>
  * <td>
  * Domain User
  * 
  * </td>
  * </tr>
  * <tr>
  * <td>
  * <b>Profile</b>
  * 
  * </td>
  * <td>
  * Empty
  * 
  * </td>
  * </tr>
  * <tr>
  * <td>
  * <b>Account Never Expires</b>
  * 
  * </td>
  * <td>
  * <b>TRUE</b>
  * 
  * </td>
  * </tr>
  * </table>
  *  
  * 
  * To create a local user, bind to a target computer, as shown in the following code example.
  * 
  * 
  * ```vb
  * Dim mach As IADsContainer
  * Dim usr as IADsUser
  * 
  * On Error GoTo Cleanup
  * Set mach = GetObject("WinNT://MyMachine,Computer")
  * Set usr = mach.Create("user","jeffsmith")
  * usr.SetInfo
  * 
  * Cleanup:
  *     If(Err.Number<>0) Then
  *         MsgBox("An error has occurred. " & Err.Number)
  *     End If
  *     Set mach = Nothing
  *     Set usr = Nothing
  * 
  * ```
  * 
  * 
  * The newly created local user will have the same default properties as the domain user. The group membership, however, will be "users", instead of "domain user".
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//iads/nn-iads-iadsuser
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 */
class IADsUser extends IADs{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IADsUser
     * @type {Guid}
     */
    static IID => Guid("{3e37e320-17e2-11cf-abc4-02608c9e7553}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 20

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_BadLoginAddress", "get_BadLoginCount", "get_LastLogin", "get_LastLogoff", "get_LastFailedLogin", "get_PasswordLastChanged", "get_Description", "put_Description", "get_Division", "put_Division", "get_Department", "put_Department", "get_EmployeeID", "put_EmployeeID", "get_FullName", "put_FullName", "get_FirstName", "put_FirstName", "get_LastName", "put_LastName", "get_OtherName", "put_OtherName", "get_NamePrefix", "put_NamePrefix", "get_NameSuffix", "put_NameSuffix", "get_Title", "put_Title", "get_Manager", "put_Manager", "get_TelephoneHome", "put_TelephoneHome", "get_TelephoneMobile", "put_TelephoneMobile", "get_TelephoneNumber", "put_TelephoneNumber", "get_TelephonePager", "put_TelephonePager", "get_FaxNumber", "put_FaxNumber", "get_OfficeLocations", "put_OfficeLocations", "get_PostalAddresses", "put_PostalAddresses", "get_PostalCodes", "put_PostalCodes", "get_SeeAlso", "put_SeeAlso", "get_AccountDisabled", "put_AccountDisabled", "get_AccountExpirationDate", "put_AccountExpirationDate", "get_GraceLoginsAllowed", "put_GraceLoginsAllowed", "get_GraceLoginsRemaining", "put_GraceLoginsRemaining", "get_IsAccountLocked", "put_IsAccountLocked", "get_LoginHours", "put_LoginHours", "get_LoginWorkstations", "put_LoginWorkstations", "get_MaxLogins", "put_MaxLogins", "get_MaxStorage", "put_MaxStorage", "get_PasswordExpirationDate", "put_PasswordExpirationDate", "get_PasswordMinimumLength", "put_PasswordMinimumLength", "get_PasswordRequired", "put_PasswordRequired", "get_RequireUniquePassword", "put_RequireUniquePassword", "get_EmailAddress", "put_EmailAddress", "get_HomeDirectory", "put_HomeDirectory", "get_Languages", "put_Languages", "get_Profile", "put_Profile", "get_LoginScript", "put_LoginScript", "get_Picture", "put_Picture", "get_HomePage", "put_HomePage", "Groups", "SetPassword", "ChangePassword"]

    /**
     * 
     * @param {Pointer<BSTR>} retval 
     * @returns {HRESULT} 
     */
    get_BadLoginAddress(retval) {
        result := ComCall(20, this, "ptr", retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} retval 
     * @returns {HRESULT} 
     */
    get_BadLoginCount(retval) {
        retvalMarshal := retval is VarRef ? "int*" : "ptr"

        result := ComCall(21, this, retvalMarshal, retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} retval 
     * @returns {HRESULT} 
     */
    get_LastLogin(retval) {
        retvalMarshal := retval is VarRef ? "double*" : "ptr"

        result := ComCall(22, this, retvalMarshal, retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} retval 
     * @returns {HRESULT} 
     */
    get_LastLogoff(retval) {
        retvalMarshal := retval is VarRef ? "double*" : "ptr"

        result := ComCall(23, this, retvalMarshal, retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} retval 
     * @returns {HRESULT} 
     */
    get_LastFailedLogin(retval) {
        retvalMarshal := retval is VarRef ? "double*" : "ptr"

        result := ComCall(24, this, retvalMarshal, retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} retval 
     * @returns {HRESULT} 
     */
    get_PasswordLastChanged(retval) {
        retvalMarshal := retval is VarRef ? "double*" : "ptr"

        result := ComCall(25, this, retvalMarshal, retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} retval 
     * @returns {HRESULT} 
     */
    get_Description(retval) {
        result := ComCall(26, this, "ptr", retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrDescription 
     * @returns {HRESULT} 
     */
    put_Description(bstrDescription) {
        bstrDescription := bstrDescription is String ? BSTR.Alloc(bstrDescription).Value : bstrDescription

        result := ComCall(27, this, "ptr", bstrDescription, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} retval 
     * @returns {HRESULT} 
     */
    get_Division(retval) {
        result := ComCall(28, this, "ptr", retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrDivision 
     * @returns {HRESULT} 
     */
    put_Division(bstrDivision) {
        bstrDivision := bstrDivision is String ? BSTR.Alloc(bstrDivision).Value : bstrDivision

        result := ComCall(29, this, "ptr", bstrDivision, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} retval 
     * @returns {HRESULT} 
     */
    get_Department(retval) {
        result := ComCall(30, this, "ptr", retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrDepartment 
     * @returns {HRESULT} 
     */
    put_Department(bstrDepartment) {
        bstrDepartment := bstrDepartment is String ? BSTR.Alloc(bstrDepartment).Value : bstrDepartment

        result := ComCall(31, this, "ptr", bstrDepartment, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} retval 
     * @returns {HRESULT} 
     */
    get_EmployeeID(retval) {
        result := ComCall(32, this, "ptr", retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrEmployeeID 
     * @returns {HRESULT} 
     */
    put_EmployeeID(bstrEmployeeID) {
        bstrEmployeeID := bstrEmployeeID is String ? BSTR.Alloc(bstrEmployeeID).Value : bstrEmployeeID

        result := ComCall(33, this, "ptr", bstrEmployeeID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} retval 
     * @returns {HRESULT} 
     */
    get_FullName(retval) {
        result := ComCall(34, this, "ptr", retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrFullName 
     * @returns {HRESULT} 
     */
    put_FullName(bstrFullName) {
        bstrFullName := bstrFullName is String ? BSTR.Alloc(bstrFullName).Value : bstrFullName

        result := ComCall(35, this, "ptr", bstrFullName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} retval 
     * @returns {HRESULT} 
     */
    get_FirstName(retval) {
        result := ComCall(36, this, "ptr", retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrFirstName 
     * @returns {HRESULT} 
     */
    put_FirstName(bstrFirstName) {
        bstrFirstName := bstrFirstName is String ? BSTR.Alloc(bstrFirstName).Value : bstrFirstName

        result := ComCall(37, this, "ptr", bstrFirstName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} retval 
     * @returns {HRESULT} 
     */
    get_LastName(retval) {
        result := ComCall(38, this, "ptr", retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrLastName 
     * @returns {HRESULT} 
     */
    put_LastName(bstrLastName) {
        bstrLastName := bstrLastName is String ? BSTR.Alloc(bstrLastName).Value : bstrLastName

        result := ComCall(39, this, "ptr", bstrLastName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} retval 
     * @returns {HRESULT} 
     */
    get_OtherName(retval) {
        result := ComCall(40, this, "ptr", retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrOtherName 
     * @returns {HRESULT} 
     */
    put_OtherName(bstrOtherName) {
        bstrOtherName := bstrOtherName is String ? BSTR.Alloc(bstrOtherName).Value : bstrOtherName

        result := ComCall(41, this, "ptr", bstrOtherName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} retval 
     * @returns {HRESULT} 
     */
    get_NamePrefix(retval) {
        result := ComCall(42, this, "ptr", retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrNamePrefix 
     * @returns {HRESULT} 
     */
    put_NamePrefix(bstrNamePrefix) {
        bstrNamePrefix := bstrNamePrefix is String ? BSTR.Alloc(bstrNamePrefix).Value : bstrNamePrefix

        result := ComCall(43, this, "ptr", bstrNamePrefix, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} retval 
     * @returns {HRESULT} 
     */
    get_NameSuffix(retval) {
        result := ComCall(44, this, "ptr", retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrNameSuffix 
     * @returns {HRESULT} 
     */
    put_NameSuffix(bstrNameSuffix) {
        bstrNameSuffix := bstrNameSuffix is String ? BSTR.Alloc(bstrNameSuffix).Value : bstrNameSuffix

        result := ComCall(45, this, "ptr", bstrNameSuffix, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} retval 
     * @returns {HRESULT} 
     */
    get_Title(retval) {
        result := ComCall(46, this, "ptr", retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrTitle 
     * @returns {HRESULT} 
     */
    put_Title(bstrTitle) {
        bstrTitle := bstrTitle is String ? BSTR.Alloc(bstrTitle).Value : bstrTitle

        result := ComCall(47, this, "ptr", bstrTitle, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} retval 
     * @returns {HRESULT} 
     */
    get_Manager(retval) {
        result := ComCall(48, this, "ptr", retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrManager 
     * @returns {HRESULT} 
     */
    put_Manager(bstrManager) {
        bstrManager := bstrManager is String ? BSTR.Alloc(bstrManager).Value : bstrManager

        result := ComCall(49, this, "ptr", bstrManager, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} retval 
     * @returns {HRESULT} 
     */
    get_TelephoneHome(retval) {
        result := ComCall(50, this, "ptr", retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} vTelephoneHome 
     * @returns {HRESULT} 
     */
    put_TelephoneHome(vTelephoneHome) {
        result := ComCall(51, this, "ptr", vTelephoneHome, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} retval 
     * @returns {HRESULT} 
     */
    get_TelephoneMobile(retval) {
        result := ComCall(52, this, "ptr", retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} vTelephoneMobile 
     * @returns {HRESULT} 
     */
    put_TelephoneMobile(vTelephoneMobile) {
        result := ComCall(53, this, "ptr", vTelephoneMobile, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} retval 
     * @returns {HRESULT} 
     */
    get_TelephoneNumber(retval) {
        result := ComCall(54, this, "ptr", retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} vTelephoneNumber 
     * @returns {HRESULT} 
     */
    put_TelephoneNumber(vTelephoneNumber) {
        result := ComCall(55, this, "ptr", vTelephoneNumber, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} retval 
     * @returns {HRESULT} 
     */
    get_TelephonePager(retval) {
        result := ComCall(56, this, "ptr", retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} vTelephonePager 
     * @returns {HRESULT} 
     */
    put_TelephonePager(vTelephonePager) {
        result := ComCall(57, this, "ptr", vTelephonePager, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} retval 
     * @returns {HRESULT} 
     */
    get_FaxNumber(retval) {
        result := ComCall(58, this, "ptr", retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} vFaxNumber 
     * @returns {HRESULT} 
     */
    put_FaxNumber(vFaxNumber) {
        result := ComCall(59, this, "ptr", vFaxNumber, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} retval 
     * @returns {HRESULT} 
     */
    get_OfficeLocations(retval) {
        result := ComCall(60, this, "ptr", retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} vOfficeLocations 
     * @returns {HRESULT} 
     */
    put_OfficeLocations(vOfficeLocations) {
        result := ComCall(61, this, "ptr", vOfficeLocations, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} retval 
     * @returns {HRESULT} 
     */
    get_PostalAddresses(retval) {
        result := ComCall(62, this, "ptr", retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} vPostalAddresses 
     * @returns {HRESULT} 
     */
    put_PostalAddresses(vPostalAddresses) {
        result := ComCall(63, this, "ptr", vPostalAddresses, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} retval 
     * @returns {HRESULT} 
     */
    get_PostalCodes(retval) {
        result := ComCall(64, this, "ptr", retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} vPostalCodes 
     * @returns {HRESULT} 
     */
    put_PostalCodes(vPostalCodes) {
        result := ComCall(65, this, "ptr", vPostalCodes, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} retval 
     * @returns {HRESULT} 
     */
    get_SeeAlso(retval) {
        result := ComCall(66, this, "ptr", retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} vSeeAlso 
     * @returns {HRESULT} 
     */
    put_SeeAlso(vSeeAlso) {
        result := ComCall(67, this, "ptr", vSeeAlso, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} retval 
     * @returns {HRESULT} 
     */
    get_AccountDisabled(retval) {
        result := ComCall(68, this, "ptr", retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} fAccountDisabled 
     * @returns {HRESULT} 
     */
    put_AccountDisabled(fAccountDisabled) {
        result := ComCall(69, this, "short", fAccountDisabled, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} retval 
     * @returns {HRESULT} 
     */
    get_AccountExpirationDate(retval) {
        retvalMarshal := retval is VarRef ? "double*" : "ptr"

        result := ComCall(70, this, retvalMarshal, retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} daAccountExpirationDate 
     * @returns {HRESULT} 
     */
    put_AccountExpirationDate(daAccountExpirationDate) {
        result := ComCall(71, this, "double", daAccountExpirationDate, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} retval 
     * @returns {HRESULT} 
     */
    get_GraceLoginsAllowed(retval) {
        retvalMarshal := retval is VarRef ? "int*" : "ptr"

        result := ComCall(72, this, retvalMarshal, retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lnGraceLoginsAllowed 
     * @returns {HRESULT} 
     */
    put_GraceLoginsAllowed(lnGraceLoginsAllowed) {
        result := ComCall(73, this, "int", lnGraceLoginsAllowed, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} retval 
     * @returns {HRESULT} 
     */
    get_GraceLoginsRemaining(retval) {
        retvalMarshal := retval is VarRef ? "int*" : "ptr"

        result := ComCall(74, this, retvalMarshal, retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lnGraceLoginsRemaining 
     * @returns {HRESULT} 
     */
    put_GraceLoginsRemaining(lnGraceLoginsRemaining) {
        result := ComCall(75, this, "int", lnGraceLoginsRemaining, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} retval 
     * @returns {HRESULT} 
     */
    get_IsAccountLocked(retval) {
        result := ComCall(76, this, "ptr", retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} fIsAccountLocked 
     * @returns {HRESULT} 
     */
    put_IsAccountLocked(fIsAccountLocked) {
        result := ComCall(77, this, "short", fIsAccountLocked, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} retval 
     * @returns {HRESULT} 
     */
    get_LoginHours(retval) {
        result := ComCall(78, this, "ptr", retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} vLoginHours 
     * @returns {HRESULT} 
     */
    put_LoginHours(vLoginHours) {
        result := ComCall(79, this, "ptr", vLoginHours, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} retval 
     * @returns {HRESULT} 
     */
    get_LoginWorkstations(retval) {
        result := ComCall(80, this, "ptr", retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} vLoginWorkstations 
     * @returns {HRESULT} 
     */
    put_LoginWorkstations(vLoginWorkstations) {
        result := ComCall(81, this, "ptr", vLoginWorkstations, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} retval 
     * @returns {HRESULT} 
     */
    get_MaxLogins(retval) {
        retvalMarshal := retval is VarRef ? "int*" : "ptr"

        result := ComCall(82, this, retvalMarshal, retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lnMaxLogins 
     * @returns {HRESULT} 
     */
    put_MaxLogins(lnMaxLogins) {
        result := ComCall(83, this, "int", lnMaxLogins, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} retval 
     * @returns {HRESULT} 
     */
    get_MaxStorage(retval) {
        retvalMarshal := retval is VarRef ? "int*" : "ptr"

        result := ComCall(84, this, retvalMarshal, retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lnMaxStorage 
     * @returns {HRESULT} 
     */
    put_MaxStorage(lnMaxStorage) {
        result := ComCall(85, this, "int", lnMaxStorage, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} retval 
     * @returns {HRESULT} 
     */
    get_PasswordExpirationDate(retval) {
        retvalMarshal := retval is VarRef ? "double*" : "ptr"

        result := ComCall(86, this, retvalMarshal, retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} daPasswordExpirationDate 
     * @returns {HRESULT} 
     */
    put_PasswordExpirationDate(daPasswordExpirationDate) {
        result := ComCall(87, this, "double", daPasswordExpirationDate, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} retval 
     * @returns {HRESULT} 
     */
    get_PasswordMinimumLength(retval) {
        retvalMarshal := retval is VarRef ? "int*" : "ptr"

        result := ComCall(88, this, retvalMarshal, retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lnPasswordMinimumLength 
     * @returns {HRESULT} 
     */
    put_PasswordMinimumLength(lnPasswordMinimumLength) {
        result := ComCall(89, this, "int", lnPasswordMinimumLength, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} retval 
     * @returns {HRESULT} 
     */
    get_PasswordRequired(retval) {
        result := ComCall(90, this, "ptr", retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} fPasswordRequired 
     * @returns {HRESULT} 
     */
    put_PasswordRequired(fPasswordRequired) {
        result := ComCall(91, this, "short", fPasswordRequired, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} retval 
     * @returns {HRESULT} 
     */
    get_RequireUniquePassword(retval) {
        result := ComCall(92, this, "ptr", retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} fRequireUniquePassword 
     * @returns {HRESULT} 
     */
    put_RequireUniquePassword(fRequireUniquePassword) {
        result := ComCall(93, this, "short", fRequireUniquePassword, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} retval 
     * @returns {HRESULT} 
     */
    get_EmailAddress(retval) {
        result := ComCall(94, this, "ptr", retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrEmailAddress 
     * @returns {HRESULT} 
     */
    put_EmailAddress(bstrEmailAddress) {
        bstrEmailAddress := bstrEmailAddress is String ? BSTR.Alloc(bstrEmailAddress).Value : bstrEmailAddress

        result := ComCall(95, this, "ptr", bstrEmailAddress, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} retval 
     * @returns {HRESULT} 
     */
    get_HomeDirectory(retval) {
        result := ComCall(96, this, "ptr", retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrHomeDirectory 
     * @returns {HRESULT} 
     */
    put_HomeDirectory(bstrHomeDirectory) {
        bstrHomeDirectory := bstrHomeDirectory is String ? BSTR.Alloc(bstrHomeDirectory).Value : bstrHomeDirectory

        result := ComCall(97, this, "ptr", bstrHomeDirectory, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} retval 
     * @returns {HRESULT} 
     */
    get_Languages(retval) {
        result := ComCall(98, this, "ptr", retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} vLanguages 
     * @returns {HRESULT} 
     */
    put_Languages(vLanguages) {
        result := ComCall(99, this, "ptr", vLanguages, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} retval 
     * @returns {HRESULT} 
     */
    get_Profile(retval) {
        result := ComCall(100, this, "ptr", retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrProfile 
     * @returns {HRESULT} 
     */
    put_Profile(bstrProfile) {
        bstrProfile := bstrProfile is String ? BSTR.Alloc(bstrProfile).Value : bstrProfile

        result := ComCall(101, this, "ptr", bstrProfile, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} retval 
     * @returns {HRESULT} 
     */
    get_LoginScript(retval) {
        result := ComCall(102, this, "ptr", retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrLoginScript 
     * @returns {HRESULT} 
     */
    put_LoginScript(bstrLoginScript) {
        bstrLoginScript := bstrLoginScript is String ? BSTR.Alloc(bstrLoginScript).Value : bstrLoginScript

        result := ComCall(103, this, "ptr", bstrLoginScript, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} retval 
     * @returns {HRESULT} 
     */
    get_Picture(retval) {
        result := ComCall(104, this, "ptr", retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} vPicture 
     * @returns {HRESULT} 
     */
    put_Picture(vPicture) {
        result := ComCall(105, this, "ptr", vPicture, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} retval 
     * @returns {HRESULT} 
     */
    get_HomePage(retval) {
        result := ComCall(106, this, "ptr", retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrHomePage 
     * @returns {HRESULT} 
     */
    put_HomePage(bstrHomePage) {
        bstrHomePage := bstrHomePage is String ? BSTR.Alloc(bstrHomePage).Value : bstrHomePage

        result := ComCall(107, this, "ptr", bstrHomePage, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IADsMembers>} ppGroups 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/iads/nf-iads-iadsuser-groups
     */
    Groups(ppGroups) {
        result := ComCall(108, this, "ptr*", ppGroups, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} NewPassword 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/iads/nf-iads-iadsuser-setpassword
     */
    SetPassword(NewPassword) {
        NewPassword := NewPassword is String ? BSTR.Alloc(NewPassword).Value : NewPassword

        result := ComCall(109, this, "ptr", NewPassword, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrOldPassword 
     * @param {BSTR} bstrNewPassword 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/iads/nf-iads-iadsuser-changepassword
     */
    ChangePassword(bstrOldPassword, bstrNewPassword) {
        bstrOldPassword := bstrOldPassword is String ? BSTR.Alloc(bstrOldPassword).Value : bstrOldPassword
        bstrNewPassword := bstrNewPassword is String ? BSTR.Alloc(bstrNewPassword).Value : bstrNewPassword

        result := ComCall(110, this, "ptr", bstrOldPassword, "ptr", bstrNewPassword, "HRESULT")
        return result
    }
}
