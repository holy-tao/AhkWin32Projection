#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Variant\VARIANT.ahk
#Include .\IADsMembers.ahk
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
     * @type {BSTR} 
     */
    BadLoginAddress {
        get => this.get_BadLoginAddress()
    }

    /**
     * @type {Integer} 
     */
    BadLoginCount {
        get => this.get_BadLoginCount()
    }

    /**
     * @type {Float} 
     */
    LastLogin {
        get => this.get_LastLogin()
    }

    /**
     * @type {Float} 
     */
    LastLogoff {
        get => this.get_LastLogoff()
    }

    /**
     * @type {Float} 
     */
    LastFailedLogin {
        get => this.get_LastFailedLogin()
    }

    /**
     * @type {Float} 
     */
    PasswordLastChanged {
        get => this.get_PasswordLastChanged()
    }

    /**
     * @type {BSTR} 
     */
    Description {
        get => this.get_Description()
        set => this.put_Description(value)
    }

    /**
     * @type {BSTR} 
     */
    Division {
        get => this.get_Division()
        set => this.put_Division(value)
    }

    /**
     * @type {BSTR} 
     */
    Department {
        get => this.get_Department()
        set => this.put_Department(value)
    }

    /**
     * @type {BSTR} 
     */
    EmployeeID {
        get => this.get_EmployeeID()
        set => this.put_EmployeeID(value)
    }

    /**
     * @type {BSTR} 
     */
    FullName {
        get => this.get_FullName()
        set => this.put_FullName(value)
    }

    /**
     * @type {BSTR} 
     */
    FirstName {
        get => this.get_FirstName()
        set => this.put_FirstName(value)
    }

    /**
     * @type {BSTR} 
     */
    LastName {
        get => this.get_LastName()
        set => this.put_LastName(value)
    }

    /**
     * @type {BSTR} 
     */
    OtherName {
        get => this.get_OtherName()
        set => this.put_OtherName(value)
    }

    /**
     * @type {BSTR} 
     */
    NamePrefix {
        get => this.get_NamePrefix()
        set => this.put_NamePrefix(value)
    }

    /**
     * @type {BSTR} 
     */
    NameSuffix {
        get => this.get_NameSuffix()
        set => this.put_NameSuffix(value)
    }

    /**
     * @type {BSTR} 
     */
    Title {
        get => this.get_Title()
        set => this.put_Title(value)
    }

    /**
     * @type {BSTR} 
     */
    Manager {
        get => this.get_Manager()
        set => this.put_Manager(value)
    }

    /**
     * @type {VARIANT} 
     */
    TelephoneHome {
        get => this.get_TelephoneHome()
        set => this.put_TelephoneHome(value)
    }

    /**
     * @type {VARIANT} 
     */
    TelephoneMobile {
        get => this.get_TelephoneMobile()
        set => this.put_TelephoneMobile(value)
    }

    /**
     * @type {VARIANT} 
     */
    TelephoneNumber {
        get => this.get_TelephoneNumber()
        set => this.put_TelephoneNumber(value)
    }

    /**
     * @type {VARIANT} 
     */
    TelephonePager {
        get => this.get_TelephonePager()
        set => this.put_TelephonePager(value)
    }

    /**
     * @type {VARIANT} 
     */
    FaxNumber {
        get => this.get_FaxNumber()
        set => this.put_FaxNumber(value)
    }

    /**
     * @type {VARIANT} 
     */
    OfficeLocations {
        get => this.get_OfficeLocations()
        set => this.put_OfficeLocations(value)
    }

    /**
     * @type {VARIANT} 
     */
    PostalAddresses {
        get => this.get_PostalAddresses()
        set => this.put_PostalAddresses(value)
    }

    /**
     * @type {VARIANT} 
     */
    PostalCodes {
        get => this.get_PostalCodes()
        set => this.put_PostalCodes(value)
    }

    /**
     * @type {VARIANT} 
     */
    SeeAlso {
        get => this.get_SeeAlso()
        set => this.put_SeeAlso(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    AccountDisabled {
        get => this.get_AccountDisabled()
        set => this.put_AccountDisabled(value)
    }

    /**
     * @type {Float} 
     */
    AccountExpirationDate {
        get => this.get_AccountExpirationDate()
        set => this.put_AccountExpirationDate(value)
    }

    /**
     * @type {Integer} 
     */
    GraceLoginsAllowed {
        get => this.get_GraceLoginsAllowed()
        set => this.put_GraceLoginsAllowed(value)
    }

    /**
     * @type {Integer} 
     */
    GraceLoginsRemaining {
        get => this.get_GraceLoginsRemaining()
        set => this.put_GraceLoginsRemaining(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    IsAccountLocked {
        get => this.get_IsAccountLocked()
        set => this.put_IsAccountLocked(value)
    }

    /**
     * @type {VARIANT} 
     */
    LoginHours {
        get => this.get_LoginHours()
        set => this.put_LoginHours(value)
    }

    /**
     * @type {VARIANT} 
     */
    LoginWorkstations {
        get => this.get_LoginWorkstations()
        set => this.put_LoginWorkstations(value)
    }

    /**
     * @type {Integer} 
     */
    MaxLogins {
        get => this.get_MaxLogins()
        set => this.put_MaxLogins(value)
    }

    /**
     * @type {Integer} 
     */
    MaxStorage {
        get => this.get_MaxStorage()
        set => this.put_MaxStorage(value)
    }

    /**
     * @type {Float} 
     */
    PasswordExpirationDate {
        get => this.get_PasswordExpirationDate()
        set => this.put_PasswordExpirationDate(value)
    }

    /**
     * @type {Integer} 
     */
    PasswordMinimumLength {
        get => this.get_PasswordMinimumLength()
        set => this.put_PasswordMinimumLength(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    PasswordRequired {
        get => this.get_PasswordRequired()
        set => this.put_PasswordRequired(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    RequireUniquePassword {
        get => this.get_RequireUniquePassword()
        set => this.put_RequireUniquePassword(value)
    }

    /**
     * @type {BSTR} 
     */
    EmailAddress {
        get => this.get_EmailAddress()
        set => this.put_EmailAddress(value)
    }

    /**
     * @type {BSTR} 
     */
    HomeDirectory {
        get => this.get_HomeDirectory()
        set => this.put_HomeDirectory(value)
    }

    /**
     * @type {VARIANT} 
     */
    Languages {
        get => this.get_Languages()
        set => this.put_Languages(value)
    }

    /**
     * @type {BSTR} 
     */
    Profile {
        get => this.get_Profile()
        set => this.put_Profile(value)
    }

    /**
     * @type {BSTR} 
     */
    LoginScript {
        get => this.get_LoginScript()
        set => this.put_LoginScript(value)
    }

    /**
     * @type {VARIANT} 
     */
    Picture {
        get => this.get_Picture()
        set => this.put_Picture(value)
    }

    /**
     * @type {BSTR} 
     */
    HomePage {
        get => this.get_HomePage()
        set => this.put_HomePage(value)
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_BadLoginAddress() {
        retval := BSTR()
        result := ComCall(20, this, "ptr", retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_BadLoginCount() {
        result := ComCall(21, this, "int*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * 
     * @returns {Float} 
     */
    get_LastLogin() {
        result := ComCall(22, this, "double*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * 
     * @returns {Float} 
     */
    get_LastLogoff() {
        result := ComCall(23, this, "double*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * 
     * @returns {Float} 
     */
    get_LastFailedLogin() {
        result := ComCall(24, this, "double*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * 
     * @returns {Float} 
     */
    get_PasswordLastChanged() {
        result := ComCall(25, this, "double*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Description() {
        retval := BSTR()
        result := ComCall(26, this, "ptr", retval, "HRESULT")
        return retval
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
     * @returns {BSTR} 
     */
    get_Division() {
        retval := BSTR()
        result := ComCall(28, this, "ptr", retval, "HRESULT")
        return retval
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
     * @returns {BSTR} 
     */
    get_Department() {
        retval := BSTR()
        result := ComCall(30, this, "ptr", retval, "HRESULT")
        return retval
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
     * @returns {BSTR} 
     */
    get_EmployeeID() {
        retval := BSTR()
        result := ComCall(32, this, "ptr", retval, "HRESULT")
        return retval
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
     * @returns {BSTR} 
     */
    get_FullName() {
        retval := BSTR()
        result := ComCall(34, this, "ptr", retval, "HRESULT")
        return retval
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
     * @returns {BSTR} 
     */
    get_FirstName() {
        retval := BSTR()
        result := ComCall(36, this, "ptr", retval, "HRESULT")
        return retval
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
     * @returns {BSTR} 
     */
    get_LastName() {
        retval := BSTR()
        result := ComCall(38, this, "ptr", retval, "HRESULT")
        return retval
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
     * @returns {BSTR} 
     */
    get_OtherName() {
        retval := BSTR()
        result := ComCall(40, this, "ptr", retval, "HRESULT")
        return retval
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
     * @returns {BSTR} 
     */
    get_NamePrefix() {
        retval := BSTR()
        result := ComCall(42, this, "ptr", retval, "HRESULT")
        return retval
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
     * @returns {BSTR} 
     */
    get_NameSuffix() {
        retval := BSTR()
        result := ComCall(44, this, "ptr", retval, "HRESULT")
        return retval
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
     * @returns {BSTR} 
     */
    get_Title() {
        retval := BSTR()
        result := ComCall(46, this, "ptr", retval, "HRESULT")
        return retval
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
     * @returns {BSTR} 
     */
    get_Manager() {
        retval := BSTR()
        result := ComCall(48, this, "ptr", retval, "HRESULT")
        return retval
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
     * @returns {VARIANT} 
     */
    get_TelephoneHome() {
        retval := VARIANT()
        result := ComCall(50, this, "ptr", retval, "HRESULT")
        return retval
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
     * @returns {VARIANT} 
     */
    get_TelephoneMobile() {
        retval := VARIANT()
        result := ComCall(52, this, "ptr", retval, "HRESULT")
        return retval
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
     * @returns {VARIANT} 
     */
    get_TelephoneNumber() {
        retval := VARIANT()
        result := ComCall(54, this, "ptr", retval, "HRESULT")
        return retval
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
     * @returns {VARIANT} 
     */
    get_TelephonePager() {
        retval := VARIANT()
        result := ComCall(56, this, "ptr", retval, "HRESULT")
        return retval
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
     * @returns {VARIANT} 
     */
    get_FaxNumber() {
        retval := VARIANT()
        result := ComCall(58, this, "ptr", retval, "HRESULT")
        return retval
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
     * @returns {VARIANT} 
     */
    get_OfficeLocations() {
        retval := VARIANT()
        result := ComCall(60, this, "ptr", retval, "HRESULT")
        return retval
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
     * @returns {VARIANT} 
     */
    get_PostalAddresses() {
        retval := VARIANT()
        result := ComCall(62, this, "ptr", retval, "HRESULT")
        return retval
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
     * @returns {VARIANT} 
     */
    get_PostalCodes() {
        retval := VARIANT()
        result := ComCall(64, this, "ptr", retval, "HRESULT")
        return retval
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
     * @returns {VARIANT} 
     */
    get_SeeAlso() {
        retval := VARIANT()
        result := ComCall(66, this, "ptr", retval, "HRESULT")
        return retval
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
     * @returns {VARIANT_BOOL} 
     */
    get_AccountDisabled() {
        result := ComCall(68, this, "short*", &retval := 0, "HRESULT")
        return retval
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
     * @returns {Float} 
     */
    get_AccountExpirationDate() {
        result := ComCall(70, this, "double*", &retval := 0, "HRESULT")
        return retval
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
     * @returns {Integer} 
     */
    get_GraceLoginsAllowed() {
        result := ComCall(72, this, "int*", &retval := 0, "HRESULT")
        return retval
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
     * @returns {Integer} 
     */
    get_GraceLoginsRemaining() {
        result := ComCall(74, this, "int*", &retval := 0, "HRESULT")
        return retval
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
     * @returns {VARIANT_BOOL} 
     */
    get_IsAccountLocked() {
        result := ComCall(76, this, "short*", &retval := 0, "HRESULT")
        return retval
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
     * @returns {VARIANT} 
     */
    get_LoginHours() {
        retval := VARIANT()
        result := ComCall(78, this, "ptr", retval, "HRESULT")
        return retval
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
     * @returns {VARIANT} 
     */
    get_LoginWorkstations() {
        retval := VARIANT()
        result := ComCall(80, this, "ptr", retval, "HRESULT")
        return retval
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
     * @returns {Integer} 
     */
    get_MaxLogins() {
        result := ComCall(82, this, "int*", &retval := 0, "HRESULT")
        return retval
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
     * @returns {Integer} 
     */
    get_MaxStorage() {
        result := ComCall(84, this, "int*", &retval := 0, "HRESULT")
        return retval
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
     * @returns {Float} 
     */
    get_PasswordExpirationDate() {
        result := ComCall(86, this, "double*", &retval := 0, "HRESULT")
        return retval
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
     * @returns {Integer} 
     */
    get_PasswordMinimumLength() {
        result := ComCall(88, this, "int*", &retval := 0, "HRESULT")
        return retval
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
     * @returns {VARIANT_BOOL} 
     */
    get_PasswordRequired() {
        result := ComCall(90, this, "short*", &retval := 0, "HRESULT")
        return retval
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
     * @returns {VARIANT_BOOL} 
     */
    get_RequireUniquePassword() {
        result := ComCall(92, this, "short*", &retval := 0, "HRESULT")
        return retval
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
     * @returns {BSTR} 
     */
    get_EmailAddress() {
        retval := BSTR()
        result := ComCall(94, this, "ptr", retval, "HRESULT")
        return retval
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
     * @returns {BSTR} 
     */
    get_HomeDirectory() {
        retval := BSTR()
        result := ComCall(96, this, "ptr", retval, "HRESULT")
        return retval
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
     * @returns {VARIANT} 
     */
    get_Languages() {
        retval := VARIANT()
        result := ComCall(98, this, "ptr", retval, "HRESULT")
        return retval
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
     * @returns {BSTR} 
     */
    get_Profile() {
        retval := BSTR()
        result := ComCall(100, this, "ptr", retval, "HRESULT")
        return retval
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
     * @returns {BSTR} 
     */
    get_LoginScript() {
        retval := BSTR()
        result := ComCall(102, this, "ptr", retval, "HRESULT")
        return retval
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
     * @returns {VARIANT} 
     */
    get_Picture() {
        retval := VARIANT()
        result := ComCall(104, this, "ptr", retval, "HRESULT")
        return retval
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
     * @returns {BSTR} 
     */
    get_HomePage() {
        retval := BSTR()
        result := ComCall(106, this, "ptr", retval, "HRESULT")
        return retval
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
     * Obtains a collection of the ADSI group objects to which this user belongs.
     * @returns {IADsMembers} Pointer to a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/iads/nn-iads-iadsmembers">IADsMembers</a> interface on a members object that can be enumerated using  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nn-oaidl-ienumvariant">IEnumVARIANT</a> to determine the groups to which this end-user belongs.
     * @see https://docs.microsoft.com/windows/win32/api//iads/nf-iads-iadsuser-groups
     */
    Groups() {
        result := ComCall(108, this, "ptr*", &ppGroups := 0, "HRESULT")
        return IADsMembers(ppGroups)
    }

    /**
     * Sets the user password to a specified value.
     * @param {BSTR} NewPassword A <b>BSTR</b> that contains the new password.
     * @returns {HRESULT} This method supports the standard return values, including <b>S_OK</b>. For other return values, see  <a href="/windows/desktop/ADSI/adsi-error-codes">ADSI Error Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//iads/nf-iads-iadsuser-setpassword
     */
    SetPassword(NewPassword) {
        NewPassword := NewPassword is String ? BSTR.Alloc(NewPassword).Value : NewPassword

        result := ComCall(109, this, "ptr", NewPassword, "HRESULT")
        return result
    }

    /**
     * Changes the user password from the specified old value to a new value.
     * @param {BSTR} bstrOldPassword A <b>BSTR</b> that contains the current password.
     * @param {BSTR} bstrNewPassword A <b>BSTR</b> that contains the new password.
     * @returns {HRESULT} This method supports the standard return values, including S_OK. For more information and other return values, see  <a href="/windows/desktop/ADSI/adsi-error-codes">ADSI Error Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//iads/nf-iads-iadsuser-changepassword
     */
    ChangePassword(bstrOldPassword, bstrNewPassword) {
        bstrOldPassword := bstrOldPassword is String ? BSTR.Alloc(bstrOldPassword).Value : bstrOldPassword
        bstrNewPassword := bstrNewPassword is String ? BSTR.Alloc(bstrNewPassword).Value : bstrNewPassword

        result := ComCall(110, this, "ptr", bstrOldPassword, "ptr", bstrNewPassword, "HRESULT")
        return result
    }
}
