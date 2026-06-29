#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IADsMembers.ahk" { IADsMembers }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import ".\IADs.ahk" { IADs }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * The IADsUser interface is a dual interface that inherits from IADs.
 * @remarks
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
 * @see https://learn.microsoft.com/windows/win32/api/iads/nn-iads-iadsuser
 * @namespace Windows.Win32.Networking.ActiveDirectory
 */
export default struct IADsUser extends IADs {
    /**
     * The interface identifier for IADsUser
     * @type {Guid}
     */
    static IID := Guid("{3e37e320-17e2-11cf-abc4-02608c9e7553}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IADsUser interfaces
    */
    struct Vtbl extends IADs.Vtbl {
        get_BadLoginAddress        : IntPtr
        get_BadLoginCount          : IntPtr
        get_LastLogin              : IntPtr
        get_LastLogoff             : IntPtr
        get_LastFailedLogin        : IntPtr
        get_PasswordLastChanged    : IntPtr
        get_Description            : IntPtr
        put_Description            : IntPtr
        get_Division               : IntPtr
        put_Division               : IntPtr
        get_Department             : IntPtr
        put_Department             : IntPtr
        get_EmployeeID             : IntPtr
        put_EmployeeID             : IntPtr
        get_FullName               : IntPtr
        put_FullName               : IntPtr
        get_FirstName              : IntPtr
        put_FirstName              : IntPtr
        get_LastName               : IntPtr
        put_LastName               : IntPtr
        get_OtherName              : IntPtr
        put_OtherName              : IntPtr
        get_NamePrefix             : IntPtr
        put_NamePrefix             : IntPtr
        get_NameSuffix             : IntPtr
        put_NameSuffix             : IntPtr
        get_Title                  : IntPtr
        put_Title                  : IntPtr
        get_Manager                : IntPtr
        put_Manager                : IntPtr
        get_TelephoneHome          : IntPtr
        put_TelephoneHome          : IntPtr
        get_TelephoneMobile        : IntPtr
        put_TelephoneMobile        : IntPtr
        get_TelephoneNumber        : IntPtr
        put_TelephoneNumber        : IntPtr
        get_TelephonePager         : IntPtr
        put_TelephonePager         : IntPtr
        get_FaxNumber              : IntPtr
        put_FaxNumber              : IntPtr
        get_OfficeLocations        : IntPtr
        put_OfficeLocations        : IntPtr
        get_PostalAddresses        : IntPtr
        put_PostalAddresses        : IntPtr
        get_PostalCodes            : IntPtr
        put_PostalCodes            : IntPtr
        get_SeeAlso                : IntPtr
        put_SeeAlso                : IntPtr
        get_AccountDisabled        : IntPtr
        put_AccountDisabled        : IntPtr
        get_AccountExpirationDate  : IntPtr
        put_AccountExpirationDate  : IntPtr
        get_GraceLoginsAllowed     : IntPtr
        put_GraceLoginsAllowed     : IntPtr
        get_GraceLoginsRemaining   : IntPtr
        put_GraceLoginsRemaining   : IntPtr
        get_IsAccountLocked        : IntPtr
        put_IsAccountLocked        : IntPtr
        get_LoginHours             : IntPtr
        put_LoginHours             : IntPtr
        get_LoginWorkstations      : IntPtr
        put_LoginWorkstations      : IntPtr
        get_MaxLogins              : IntPtr
        put_MaxLogins              : IntPtr
        get_MaxStorage             : IntPtr
        put_MaxStorage             : IntPtr
        get_PasswordExpirationDate : IntPtr
        put_PasswordExpirationDate : IntPtr
        get_PasswordMinimumLength  : IntPtr
        put_PasswordMinimumLength  : IntPtr
        get_PasswordRequired       : IntPtr
        put_PasswordRequired       : IntPtr
        get_RequireUniquePassword  : IntPtr
        put_RequireUniquePassword  : IntPtr
        get_EmailAddress           : IntPtr
        put_EmailAddress           : IntPtr
        get_HomeDirectory          : IntPtr
        put_HomeDirectory          : IntPtr
        get_Languages              : IntPtr
        put_Languages              : IntPtr
        get_Profile                : IntPtr
        put_Profile                : IntPtr
        get_LoginScript            : IntPtr
        put_LoginScript            : IntPtr
        get_Picture                : IntPtr
        put_Picture                : IntPtr
        get_HomePage               : IntPtr
        put_HomePage               : IntPtr
        Groups                     : IntPtr
        SetPassword                : IntPtr
        ChangePassword             : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IADsUser.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
        retval := BSTR.Owned()
        result := ComCall(20, this, BSTR.Ptr, retval, "HRESULT")
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
        retval := BSTR.Owned()
        result := ComCall(26, this, BSTR.Ptr, retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {BSTR} bstrDescription 
     * @returns {HRESULT} 
     */
    put_Description(bstrDescription) {
        bstrDescription := bstrDescription is String ? BSTR.Alloc(bstrDescription).Value : bstrDescription

        result := ComCall(27, this, BSTR, bstrDescription, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Division() {
        retval := BSTR.Owned()
        result := ComCall(28, this, BSTR.Ptr, retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {BSTR} bstrDivision 
     * @returns {HRESULT} 
     */
    put_Division(bstrDivision) {
        bstrDivision := bstrDivision is String ? BSTR.Alloc(bstrDivision).Value : bstrDivision

        result := ComCall(29, this, BSTR, bstrDivision, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Department() {
        retval := BSTR.Owned()
        result := ComCall(30, this, BSTR.Ptr, retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {BSTR} bstrDepartment 
     * @returns {HRESULT} 
     */
    put_Department(bstrDepartment) {
        bstrDepartment := bstrDepartment is String ? BSTR.Alloc(bstrDepartment).Value : bstrDepartment

        result := ComCall(31, this, BSTR, bstrDepartment, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_EmployeeID() {
        retval := BSTR.Owned()
        result := ComCall(32, this, BSTR.Ptr, retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {BSTR} bstrEmployeeID 
     * @returns {HRESULT} 
     */
    put_EmployeeID(bstrEmployeeID) {
        bstrEmployeeID := bstrEmployeeID is String ? BSTR.Alloc(bstrEmployeeID).Value : bstrEmployeeID

        result := ComCall(33, this, BSTR, bstrEmployeeID, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_FullName() {
        retval := BSTR.Owned()
        result := ComCall(34, this, BSTR.Ptr, retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {BSTR} bstrFullName 
     * @returns {HRESULT} 
     */
    put_FullName(bstrFullName) {
        bstrFullName := bstrFullName is String ? BSTR.Alloc(bstrFullName).Value : bstrFullName

        result := ComCall(35, this, BSTR, bstrFullName, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_FirstName() {
        retval := BSTR.Owned()
        result := ComCall(36, this, BSTR.Ptr, retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {BSTR} bstrFirstName 
     * @returns {HRESULT} 
     */
    put_FirstName(bstrFirstName) {
        bstrFirstName := bstrFirstName is String ? BSTR.Alloc(bstrFirstName).Value : bstrFirstName

        result := ComCall(37, this, BSTR, bstrFirstName, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_LastName() {
        retval := BSTR.Owned()
        result := ComCall(38, this, BSTR.Ptr, retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {BSTR} bstrLastName 
     * @returns {HRESULT} 
     */
    put_LastName(bstrLastName) {
        bstrLastName := bstrLastName is String ? BSTR.Alloc(bstrLastName).Value : bstrLastName

        result := ComCall(39, this, BSTR, bstrLastName, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_OtherName() {
        retval := BSTR.Owned()
        result := ComCall(40, this, BSTR.Ptr, retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {BSTR} bstrOtherName 
     * @returns {HRESULT} 
     */
    put_OtherName(bstrOtherName) {
        bstrOtherName := bstrOtherName is String ? BSTR.Alloc(bstrOtherName).Value : bstrOtherName

        result := ComCall(41, this, BSTR, bstrOtherName, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_NamePrefix() {
        retval := BSTR.Owned()
        result := ComCall(42, this, BSTR.Ptr, retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {BSTR} bstrNamePrefix 
     * @returns {HRESULT} 
     */
    put_NamePrefix(bstrNamePrefix) {
        bstrNamePrefix := bstrNamePrefix is String ? BSTR.Alloc(bstrNamePrefix).Value : bstrNamePrefix

        result := ComCall(43, this, BSTR, bstrNamePrefix, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_NameSuffix() {
        retval := BSTR.Owned()
        result := ComCall(44, this, BSTR.Ptr, retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {BSTR} bstrNameSuffix 
     * @returns {HRESULT} 
     */
    put_NameSuffix(bstrNameSuffix) {
        bstrNameSuffix := bstrNameSuffix is String ? BSTR.Alloc(bstrNameSuffix).Value : bstrNameSuffix

        result := ComCall(45, this, BSTR, bstrNameSuffix, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Title() {
        retval := BSTR.Owned()
        result := ComCall(46, this, BSTR.Ptr, retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {BSTR} bstrTitle 
     * @returns {HRESULT} 
     */
    put_Title(bstrTitle) {
        bstrTitle := bstrTitle is String ? BSTR.Alloc(bstrTitle).Value : bstrTitle

        result := ComCall(47, this, BSTR, bstrTitle, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Manager() {
        retval := BSTR.Owned()
        result := ComCall(48, this, BSTR.Ptr, retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {BSTR} bstrManager 
     * @returns {HRESULT} 
     */
    put_Manager(bstrManager) {
        bstrManager := bstrManager is String ? BSTR.Alloc(bstrManager).Value : bstrManager

        result := ComCall(49, this, BSTR, bstrManager, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_TelephoneHome() {
        retval := VARIANT()
        result := ComCall(50, this, VARIANT.Ptr, retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {VARIANT} vTelephoneHome 
     * @returns {HRESULT} 
     */
    put_TelephoneHome(vTelephoneHome) {
        result := ComCall(51, this, VARIANT, vTelephoneHome, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_TelephoneMobile() {
        retval := VARIANT()
        result := ComCall(52, this, VARIANT.Ptr, retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {VARIANT} vTelephoneMobile 
     * @returns {HRESULT} 
     */
    put_TelephoneMobile(vTelephoneMobile) {
        result := ComCall(53, this, VARIANT, vTelephoneMobile, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_TelephoneNumber() {
        retval := VARIANT()
        result := ComCall(54, this, VARIANT.Ptr, retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {VARIANT} vTelephoneNumber 
     * @returns {HRESULT} 
     */
    put_TelephoneNumber(vTelephoneNumber) {
        result := ComCall(55, this, VARIANT, vTelephoneNumber, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_TelephonePager() {
        retval := VARIANT()
        result := ComCall(56, this, VARIANT.Ptr, retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {VARIANT} vTelephonePager 
     * @returns {HRESULT} 
     */
    put_TelephonePager(vTelephonePager) {
        result := ComCall(57, this, VARIANT, vTelephonePager, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_FaxNumber() {
        retval := VARIANT()
        result := ComCall(58, this, VARIANT.Ptr, retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {VARIANT} vFaxNumber 
     * @returns {HRESULT} 
     */
    put_FaxNumber(vFaxNumber) {
        result := ComCall(59, this, VARIANT, vFaxNumber, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_OfficeLocations() {
        retval := VARIANT()
        result := ComCall(60, this, VARIANT.Ptr, retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {VARIANT} vOfficeLocations 
     * @returns {HRESULT} 
     */
    put_OfficeLocations(vOfficeLocations) {
        result := ComCall(61, this, VARIANT, vOfficeLocations, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_PostalAddresses() {
        retval := VARIANT()
        result := ComCall(62, this, VARIANT.Ptr, retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {VARIANT} vPostalAddresses 
     * @returns {HRESULT} 
     */
    put_PostalAddresses(vPostalAddresses) {
        result := ComCall(63, this, VARIANT, vPostalAddresses, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_PostalCodes() {
        retval := VARIANT()
        result := ComCall(64, this, VARIANT.Ptr, retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {VARIANT} vPostalCodes 
     * @returns {HRESULT} 
     */
    put_PostalCodes(vPostalCodes) {
        result := ComCall(65, this, VARIANT, vPostalCodes, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_SeeAlso() {
        retval := VARIANT()
        result := ComCall(66, this, VARIANT.Ptr, retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {VARIANT} vSeeAlso 
     * @returns {HRESULT} 
     */
    put_SeeAlso(vSeeAlso) {
        result := ComCall(67, this, VARIANT, vSeeAlso, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_AccountDisabled() {
        result := ComCall(68, this, VARIANT_BOOL.Ptr, &retval := 0, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {VARIANT_BOOL} fAccountDisabled 
     * @returns {HRESULT} 
     */
    put_AccountDisabled(fAccountDisabled) {
        result := ComCall(69, this, VARIANT_BOOL, fAccountDisabled, "HRESULT")
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
        result := ComCall(76, this, VARIANT_BOOL.Ptr, &retval := 0, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {VARIANT_BOOL} fIsAccountLocked 
     * @returns {HRESULT} 
     */
    put_IsAccountLocked(fIsAccountLocked) {
        result := ComCall(77, this, VARIANT_BOOL, fIsAccountLocked, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_LoginHours() {
        retval := VARIANT()
        result := ComCall(78, this, VARIANT.Ptr, retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {VARIANT} vLoginHours 
     * @returns {HRESULT} 
     */
    put_LoginHours(vLoginHours) {
        result := ComCall(79, this, VARIANT, vLoginHours, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_LoginWorkstations() {
        retval := VARIANT()
        result := ComCall(80, this, VARIANT.Ptr, retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {VARIANT} vLoginWorkstations 
     * @returns {HRESULT} 
     */
    put_LoginWorkstations(vLoginWorkstations) {
        result := ComCall(81, this, VARIANT, vLoginWorkstations, "HRESULT")
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
        result := ComCall(90, this, VARIANT_BOOL.Ptr, &retval := 0, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {VARIANT_BOOL} fPasswordRequired 
     * @returns {HRESULT} 
     */
    put_PasswordRequired(fPasswordRequired) {
        result := ComCall(91, this, VARIANT_BOOL, fPasswordRequired, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_RequireUniquePassword() {
        result := ComCall(92, this, VARIANT_BOOL.Ptr, &retval := 0, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {VARIANT_BOOL} fRequireUniquePassword 
     * @returns {HRESULT} 
     */
    put_RequireUniquePassword(fRequireUniquePassword) {
        result := ComCall(93, this, VARIANT_BOOL, fRequireUniquePassword, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_EmailAddress() {
        retval := BSTR.Owned()
        result := ComCall(94, this, BSTR.Ptr, retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {BSTR} bstrEmailAddress 
     * @returns {HRESULT} 
     */
    put_EmailAddress(bstrEmailAddress) {
        bstrEmailAddress := bstrEmailAddress is String ? BSTR.Alloc(bstrEmailAddress).Value : bstrEmailAddress

        result := ComCall(95, this, BSTR, bstrEmailAddress, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_HomeDirectory() {
        retval := BSTR.Owned()
        result := ComCall(96, this, BSTR.Ptr, retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {BSTR} bstrHomeDirectory 
     * @returns {HRESULT} 
     */
    put_HomeDirectory(bstrHomeDirectory) {
        bstrHomeDirectory := bstrHomeDirectory is String ? BSTR.Alloc(bstrHomeDirectory).Value : bstrHomeDirectory

        result := ComCall(97, this, BSTR, bstrHomeDirectory, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_Languages() {
        retval := VARIANT()
        result := ComCall(98, this, VARIANT.Ptr, retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {VARIANT} vLanguages 
     * @returns {HRESULT} 
     */
    put_Languages(vLanguages) {
        result := ComCall(99, this, VARIANT, vLanguages, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Profile() {
        retval := BSTR.Owned()
        result := ComCall(100, this, BSTR.Ptr, retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {BSTR} bstrProfile 
     * @returns {HRESULT} 
     */
    put_Profile(bstrProfile) {
        bstrProfile := bstrProfile is String ? BSTR.Alloc(bstrProfile).Value : bstrProfile

        result := ComCall(101, this, BSTR, bstrProfile, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_LoginScript() {
        retval := BSTR.Owned()
        result := ComCall(102, this, BSTR.Ptr, retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {BSTR} bstrLoginScript 
     * @returns {HRESULT} 
     */
    put_LoginScript(bstrLoginScript) {
        bstrLoginScript := bstrLoginScript is String ? BSTR.Alloc(bstrLoginScript).Value : bstrLoginScript

        result := ComCall(103, this, BSTR, bstrLoginScript, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_Picture() {
        retval := VARIANT()
        result := ComCall(104, this, VARIANT.Ptr, retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {VARIANT} vPicture 
     * @returns {HRESULT} 
     */
    put_Picture(vPicture) {
        result := ComCall(105, this, VARIANT, vPicture, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_HomePage() {
        retval := BSTR.Owned()
        result := ComCall(106, this, BSTR.Ptr, retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {BSTR} bstrHomePage 
     * @returns {HRESULT} 
     */
    put_HomePage(bstrHomePage) {
        bstrHomePage := bstrHomePage is String ? BSTR.Alloc(bstrHomePage).Value : bstrHomePage

        result := ComCall(107, this, BSTR, bstrHomePage, "HRESULT")
        return result
    }

    /**
     * Obtains a collection of the ADSI group objects to which this user belongs.
     * @returns {IADsMembers} Pointer to a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/iads/nn-iads-iadsmembers">IADsMembers</a> interface on a members object that can be enumerated using  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nn-oaidl-ienumvariant">IEnumVARIANT</a> to determine the groups to which this end-user belongs.
     * @see https://learn.microsoft.com/windows/win32/api/iads/nf-iads-iadsuser-groups
     */
    Groups() {
        result := ComCall(108, this, "ptr*", &ppGroups := 0, "HRESULT")
        return IADsMembers(ppGroups)
    }

    /**
     * Sets the user password to a specified value.
     * @remarks
     * The LDAP provider for Active Directory uses one of three processes to set the password; third-party LDAP directories such as iPlanet do not use this password authentication process. The method may vary according to the network configuration. Attempts to set the password occur in the following order:
     * 
     * <ul>
     * <li>First, the LDAP provider attempts to use LDAP over a 128-bit SSL connection. For LDAP SSL to operate successfully, the LDAP server must have the appropriate server authentication certificate installed and the clients running the ADSI code must trust the authority that issued those certificates. Both the server and the client must support 128-bit encryption.</li>
     * <li>Second, if the SSL connection is unsuccessful, the LDAP provider attempts to use Kerberos.</li>
     * <li>Third, if Kerberos is unsuccessful, the LDAP provider attempts a <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/nf-lmaccess-netusersetinfo">NetUserSetInfo</a> API call. In previous releases, ADSI called <b>NetUserSetInfo</b> in the security context in which the thread was running, and not the security context specified in the call to <a href="https://docs.microsoft.com/windows/desktop/api/iads/nf-iads-iadsopendsobject-opendsobject">IADsOpenDSObject::OpenDSObject</a> or <a href="https://docs.microsoft.com/windows/desktop/api/adshlp/nf-adshlp-adsopenobject">ADsOpenObject</a>. In later releases, this was changed so that the ADSI LDAP provider would impersonate the user specified in the <b>OpenDSObject</b> call when it calls NetUserSetInfo.</li>
     * </ul>
     * In Active Directory, the caller must have the <a href="https://docs.microsoft.com/windows/desktop/ADSchema/r-user-force-change-password">Reset Password</a> extended control access right to set the password with this method.
     * @param {BSTR} NewPassword A <b>BSTR</b> that contains the new password.
     * @returns {HRESULT} This method supports the standard return values, including <b>S_OK</b>. For other return values, see  <a href="https://docs.microsoft.com/windows/desktop/ADSI/adsi-error-codes">ADSI Error Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/iads/nf-iads-iadsuser-setpassword
     */
    SetPassword(NewPassword) {
        NewPassword := NewPassword is String ? BSTR.Alloc(NewPassword).Value : NewPassword

        result := ComCall(109, this, BSTR, NewPassword, "HRESULT")
        return result
    }

    /**
     * Changes the user password from the specified old value to a new value.
     * @remarks
     * <b>IADsUser::ChangePassword</b> functions similarly to <a href="https://docs.microsoft.com/windows/desktop/api/iads/nf-iads-iadsuser-setpassword">IADsUser::SetPassword</a> in that it will use one of three methods to try to change the password. Initially, the LDAP provider will attempt an LDAP change password operation, if a secure SSL connection to the server is established.  If this attempt fails, the LDAP provider will next try to use Kerberos (see <b>IADsUser::SetPassword</b> for some problems that may result on  Windows with cross-forest authentication), and if this also fails, it will finally call the Active Directory specific network management API, <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/nf-lmaccess-netuserchangepassword">NetUserChangePassword</a>.
     * 
     * In Active Directory, the caller must have the <a href="https://docs.microsoft.com/windows/desktop/ADSchema/r-user-change-password">Change Password</a> extended control access right to change the password with this method.
     * @param {BSTR} bstrOldPassword A <b>BSTR</b> that contains the current password.
     * @param {BSTR} bstrNewPassword A <b>BSTR</b> that contains the new password.
     * @returns {HRESULT} This method supports the standard return values, including S_OK. For more information and other return values, see  <a href="https://docs.microsoft.com/windows/desktop/ADSI/adsi-error-codes">ADSI Error Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/iads/nf-iads-iadsuser-changepassword
     */
    ChangePassword(bstrOldPassword, bstrNewPassword) {
        bstrOldPassword := bstrOldPassword is String ? BSTR.Alloc(bstrOldPassword).Value : bstrOldPassword
        bstrNewPassword := bstrNewPassword is String ? BSTR.Alloc(bstrNewPassword).Value : bstrNewPassword

        result := ComCall(110, this, BSTR, bstrOldPassword, BSTR, bstrNewPassword, "HRESULT")
        return result
    }

    Query(iid) {
        if (IADsUser.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_BadLoginAddress := CallbackCreate(GetMethod(implObj, "get_BadLoginAddress"), flags, 2)
        this.vtbl.get_BadLoginCount := CallbackCreate(GetMethod(implObj, "get_BadLoginCount"), flags, 2)
        this.vtbl.get_LastLogin := CallbackCreate(GetMethod(implObj, "get_LastLogin"), flags, 2)
        this.vtbl.get_LastLogoff := CallbackCreate(GetMethod(implObj, "get_LastLogoff"), flags, 2)
        this.vtbl.get_LastFailedLogin := CallbackCreate(GetMethod(implObj, "get_LastFailedLogin"), flags, 2)
        this.vtbl.get_PasswordLastChanged := CallbackCreate(GetMethod(implObj, "get_PasswordLastChanged"), flags, 2)
        this.vtbl.get_Description := CallbackCreate(GetMethod(implObj, "get_Description"), flags, 2)
        this.vtbl.put_Description := CallbackCreate(GetMethod(implObj, "put_Description"), flags, 2)
        this.vtbl.get_Division := CallbackCreate(GetMethod(implObj, "get_Division"), flags, 2)
        this.vtbl.put_Division := CallbackCreate(GetMethod(implObj, "put_Division"), flags, 2)
        this.vtbl.get_Department := CallbackCreate(GetMethod(implObj, "get_Department"), flags, 2)
        this.vtbl.put_Department := CallbackCreate(GetMethod(implObj, "put_Department"), flags, 2)
        this.vtbl.get_EmployeeID := CallbackCreate(GetMethod(implObj, "get_EmployeeID"), flags, 2)
        this.vtbl.put_EmployeeID := CallbackCreate(GetMethod(implObj, "put_EmployeeID"), flags, 2)
        this.vtbl.get_FullName := CallbackCreate(GetMethod(implObj, "get_FullName"), flags, 2)
        this.vtbl.put_FullName := CallbackCreate(GetMethod(implObj, "put_FullName"), flags, 2)
        this.vtbl.get_FirstName := CallbackCreate(GetMethod(implObj, "get_FirstName"), flags, 2)
        this.vtbl.put_FirstName := CallbackCreate(GetMethod(implObj, "put_FirstName"), flags, 2)
        this.vtbl.get_LastName := CallbackCreate(GetMethod(implObj, "get_LastName"), flags, 2)
        this.vtbl.put_LastName := CallbackCreate(GetMethod(implObj, "put_LastName"), flags, 2)
        this.vtbl.get_OtherName := CallbackCreate(GetMethod(implObj, "get_OtherName"), flags, 2)
        this.vtbl.put_OtherName := CallbackCreate(GetMethod(implObj, "put_OtherName"), flags, 2)
        this.vtbl.get_NamePrefix := CallbackCreate(GetMethod(implObj, "get_NamePrefix"), flags, 2)
        this.vtbl.put_NamePrefix := CallbackCreate(GetMethod(implObj, "put_NamePrefix"), flags, 2)
        this.vtbl.get_NameSuffix := CallbackCreate(GetMethod(implObj, "get_NameSuffix"), flags, 2)
        this.vtbl.put_NameSuffix := CallbackCreate(GetMethod(implObj, "put_NameSuffix"), flags, 2)
        this.vtbl.get_Title := CallbackCreate(GetMethod(implObj, "get_Title"), flags, 2)
        this.vtbl.put_Title := CallbackCreate(GetMethod(implObj, "put_Title"), flags, 2)
        this.vtbl.get_Manager := CallbackCreate(GetMethod(implObj, "get_Manager"), flags, 2)
        this.vtbl.put_Manager := CallbackCreate(GetMethod(implObj, "put_Manager"), flags, 2)
        this.vtbl.get_TelephoneHome := CallbackCreate(GetMethod(implObj, "get_TelephoneHome"), flags, 2)
        this.vtbl.put_TelephoneHome := CallbackCreate(GetMethod(implObj, "put_TelephoneHome"), flags, 2)
        this.vtbl.get_TelephoneMobile := CallbackCreate(GetMethod(implObj, "get_TelephoneMobile"), flags, 2)
        this.vtbl.put_TelephoneMobile := CallbackCreate(GetMethod(implObj, "put_TelephoneMobile"), flags, 2)
        this.vtbl.get_TelephoneNumber := CallbackCreate(GetMethod(implObj, "get_TelephoneNumber"), flags, 2)
        this.vtbl.put_TelephoneNumber := CallbackCreate(GetMethod(implObj, "put_TelephoneNumber"), flags, 2)
        this.vtbl.get_TelephonePager := CallbackCreate(GetMethod(implObj, "get_TelephonePager"), flags, 2)
        this.vtbl.put_TelephonePager := CallbackCreate(GetMethod(implObj, "put_TelephonePager"), flags, 2)
        this.vtbl.get_FaxNumber := CallbackCreate(GetMethod(implObj, "get_FaxNumber"), flags, 2)
        this.vtbl.put_FaxNumber := CallbackCreate(GetMethod(implObj, "put_FaxNumber"), flags, 2)
        this.vtbl.get_OfficeLocations := CallbackCreate(GetMethod(implObj, "get_OfficeLocations"), flags, 2)
        this.vtbl.put_OfficeLocations := CallbackCreate(GetMethod(implObj, "put_OfficeLocations"), flags, 2)
        this.vtbl.get_PostalAddresses := CallbackCreate(GetMethod(implObj, "get_PostalAddresses"), flags, 2)
        this.vtbl.put_PostalAddresses := CallbackCreate(GetMethod(implObj, "put_PostalAddresses"), flags, 2)
        this.vtbl.get_PostalCodes := CallbackCreate(GetMethod(implObj, "get_PostalCodes"), flags, 2)
        this.vtbl.put_PostalCodes := CallbackCreate(GetMethod(implObj, "put_PostalCodes"), flags, 2)
        this.vtbl.get_SeeAlso := CallbackCreate(GetMethod(implObj, "get_SeeAlso"), flags, 2)
        this.vtbl.put_SeeAlso := CallbackCreate(GetMethod(implObj, "put_SeeAlso"), flags, 2)
        this.vtbl.get_AccountDisabled := CallbackCreate(GetMethod(implObj, "get_AccountDisabled"), flags, 2)
        this.vtbl.put_AccountDisabled := CallbackCreate(GetMethod(implObj, "put_AccountDisabled"), flags, 2)
        this.vtbl.get_AccountExpirationDate := CallbackCreate(GetMethod(implObj, "get_AccountExpirationDate"), flags, 2)
        this.vtbl.put_AccountExpirationDate := CallbackCreate(GetMethod(implObj, "put_AccountExpirationDate"), flags, 2)
        this.vtbl.get_GraceLoginsAllowed := CallbackCreate(GetMethod(implObj, "get_GraceLoginsAllowed"), flags, 2)
        this.vtbl.put_GraceLoginsAllowed := CallbackCreate(GetMethod(implObj, "put_GraceLoginsAllowed"), flags, 2)
        this.vtbl.get_GraceLoginsRemaining := CallbackCreate(GetMethod(implObj, "get_GraceLoginsRemaining"), flags, 2)
        this.vtbl.put_GraceLoginsRemaining := CallbackCreate(GetMethod(implObj, "put_GraceLoginsRemaining"), flags, 2)
        this.vtbl.get_IsAccountLocked := CallbackCreate(GetMethod(implObj, "get_IsAccountLocked"), flags, 2)
        this.vtbl.put_IsAccountLocked := CallbackCreate(GetMethod(implObj, "put_IsAccountLocked"), flags, 2)
        this.vtbl.get_LoginHours := CallbackCreate(GetMethod(implObj, "get_LoginHours"), flags, 2)
        this.vtbl.put_LoginHours := CallbackCreate(GetMethod(implObj, "put_LoginHours"), flags, 2)
        this.vtbl.get_LoginWorkstations := CallbackCreate(GetMethod(implObj, "get_LoginWorkstations"), flags, 2)
        this.vtbl.put_LoginWorkstations := CallbackCreate(GetMethod(implObj, "put_LoginWorkstations"), flags, 2)
        this.vtbl.get_MaxLogins := CallbackCreate(GetMethod(implObj, "get_MaxLogins"), flags, 2)
        this.vtbl.put_MaxLogins := CallbackCreate(GetMethod(implObj, "put_MaxLogins"), flags, 2)
        this.vtbl.get_MaxStorage := CallbackCreate(GetMethod(implObj, "get_MaxStorage"), flags, 2)
        this.vtbl.put_MaxStorage := CallbackCreate(GetMethod(implObj, "put_MaxStorage"), flags, 2)
        this.vtbl.get_PasswordExpirationDate := CallbackCreate(GetMethod(implObj, "get_PasswordExpirationDate"), flags, 2)
        this.vtbl.put_PasswordExpirationDate := CallbackCreate(GetMethod(implObj, "put_PasswordExpirationDate"), flags, 2)
        this.vtbl.get_PasswordMinimumLength := CallbackCreate(GetMethod(implObj, "get_PasswordMinimumLength"), flags, 2)
        this.vtbl.put_PasswordMinimumLength := CallbackCreate(GetMethod(implObj, "put_PasswordMinimumLength"), flags, 2)
        this.vtbl.get_PasswordRequired := CallbackCreate(GetMethod(implObj, "get_PasswordRequired"), flags, 2)
        this.vtbl.put_PasswordRequired := CallbackCreate(GetMethod(implObj, "put_PasswordRequired"), flags, 2)
        this.vtbl.get_RequireUniquePassword := CallbackCreate(GetMethod(implObj, "get_RequireUniquePassword"), flags, 2)
        this.vtbl.put_RequireUniquePassword := CallbackCreate(GetMethod(implObj, "put_RequireUniquePassword"), flags, 2)
        this.vtbl.get_EmailAddress := CallbackCreate(GetMethod(implObj, "get_EmailAddress"), flags, 2)
        this.vtbl.put_EmailAddress := CallbackCreate(GetMethod(implObj, "put_EmailAddress"), flags, 2)
        this.vtbl.get_HomeDirectory := CallbackCreate(GetMethod(implObj, "get_HomeDirectory"), flags, 2)
        this.vtbl.put_HomeDirectory := CallbackCreate(GetMethod(implObj, "put_HomeDirectory"), flags, 2)
        this.vtbl.get_Languages := CallbackCreate(GetMethod(implObj, "get_Languages"), flags, 2)
        this.vtbl.put_Languages := CallbackCreate(GetMethod(implObj, "put_Languages"), flags, 2)
        this.vtbl.get_Profile := CallbackCreate(GetMethod(implObj, "get_Profile"), flags, 2)
        this.vtbl.put_Profile := CallbackCreate(GetMethod(implObj, "put_Profile"), flags, 2)
        this.vtbl.get_LoginScript := CallbackCreate(GetMethod(implObj, "get_LoginScript"), flags, 2)
        this.vtbl.put_LoginScript := CallbackCreate(GetMethod(implObj, "put_LoginScript"), flags, 2)
        this.vtbl.get_Picture := CallbackCreate(GetMethod(implObj, "get_Picture"), flags, 2)
        this.vtbl.put_Picture := CallbackCreate(GetMethod(implObj, "put_Picture"), flags, 2)
        this.vtbl.get_HomePage := CallbackCreate(GetMethod(implObj, "get_HomePage"), flags, 2)
        this.vtbl.put_HomePage := CallbackCreate(GetMethod(implObj, "put_HomePage"), flags, 2)
        this.vtbl.Groups := CallbackCreate(GetMethod(implObj, "Groups"), flags, 2)
        this.vtbl.SetPassword := CallbackCreate(GetMethod(implObj, "SetPassword"), flags, 2)
        this.vtbl.ChangePassword := CallbackCreate(GetMethod(implObj, "ChangePassword"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_BadLoginAddress)
        CallbackFree(this.vtbl.get_BadLoginCount)
        CallbackFree(this.vtbl.get_LastLogin)
        CallbackFree(this.vtbl.get_LastLogoff)
        CallbackFree(this.vtbl.get_LastFailedLogin)
        CallbackFree(this.vtbl.get_PasswordLastChanged)
        CallbackFree(this.vtbl.get_Description)
        CallbackFree(this.vtbl.put_Description)
        CallbackFree(this.vtbl.get_Division)
        CallbackFree(this.vtbl.put_Division)
        CallbackFree(this.vtbl.get_Department)
        CallbackFree(this.vtbl.put_Department)
        CallbackFree(this.vtbl.get_EmployeeID)
        CallbackFree(this.vtbl.put_EmployeeID)
        CallbackFree(this.vtbl.get_FullName)
        CallbackFree(this.vtbl.put_FullName)
        CallbackFree(this.vtbl.get_FirstName)
        CallbackFree(this.vtbl.put_FirstName)
        CallbackFree(this.vtbl.get_LastName)
        CallbackFree(this.vtbl.put_LastName)
        CallbackFree(this.vtbl.get_OtherName)
        CallbackFree(this.vtbl.put_OtherName)
        CallbackFree(this.vtbl.get_NamePrefix)
        CallbackFree(this.vtbl.put_NamePrefix)
        CallbackFree(this.vtbl.get_NameSuffix)
        CallbackFree(this.vtbl.put_NameSuffix)
        CallbackFree(this.vtbl.get_Title)
        CallbackFree(this.vtbl.put_Title)
        CallbackFree(this.vtbl.get_Manager)
        CallbackFree(this.vtbl.put_Manager)
        CallbackFree(this.vtbl.get_TelephoneHome)
        CallbackFree(this.vtbl.put_TelephoneHome)
        CallbackFree(this.vtbl.get_TelephoneMobile)
        CallbackFree(this.vtbl.put_TelephoneMobile)
        CallbackFree(this.vtbl.get_TelephoneNumber)
        CallbackFree(this.vtbl.put_TelephoneNumber)
        CallbackFree(this.vtbl.get_TelephonePager)
        CallbackFree(this.vtbl.put_TelephonePager)
        CallbackFree(this.vtbl.get_FaxNumber)
        CallbackFree(this.vtbl.put_FaxNumber)
        CallbackFree(this.vtbl.get_OfficeLocations)
        CallbackFree(this.vtbl.put_OfficeLocations)
        CallbackFree(this.vtbl.get_PostalAddresses)
        CallbackFree(this.vtbl.put_PostalAddresses)
        CallbackFree(this.vtbl.get_PostalCodes)
        CallbackFree(this.vtbl.put_PostalCodes)
        CallbackFree(this.vtbl.get_SeeAlso)
        CallbackFree(this.vtbl.put_SeeAlso)
        CallbackFree(this.vtbl.get_AccountDisabled)
        CallbackFree(this.vtbl.put_AccountDisabled)
        CallbackFree(this.vtbl.get_AccountExpirationDate)
        CallbackFree(this.vtbl.put_AccountExpirationDate)
        CallbackFree(this.vtbl.get_GraceLoginsAllowed)
        CallbackFree(this.vtbl.put_GraceLoginsAllowed)
        CallbackFree(this.vtbl.get_GraceLoginsRemaining)
        CallbackFree(this.vtbl.put_GraceLoginsRemaining)
        CallbackFree(this.vtbl.get_IsAccountLocked)
        CallbackFree(this.vtbl.put_IsAccountLocked)
        CallbackFree(this.vtbl.get_LoginHours)
        CallbackFree(this.vtbl.put_LoginHours)
        CallbackFree(this.vtbl.get_LoginWorkstations)
        CallbackFree(this.vtbl.put_LoginWorkstations)
        CallbackFree(this.vtbl.get_MaxLogins)
        CallbackFree(this.vtbl.put_MaxLogins)
        CallbackFree(this.vtbl.get_MaxStorage)
        CallbackFree(this.vtbl.put_MaxStorage)
        CallbackFree(this.vtbl.get_PasswordExpirationDate)
        CallbackFree(this.vtbl.put_PasswordExpirationDate)
        CallbackFree(this.vtbl.get_PasswordMinimumLength)
        CallbackFree(this.vtbl.put_PasswordMinimumLength)
        CallbackFree(this.vtbl.get_PasswordRequired)
        CallbackFree(this.vtbl.put_PasswordRequired)
        CallbackFree(this.vtbl.get_RequireUniquePassword)
        CallbackFree(this.vtbl.put_RequireUniquePassword)
        CallbackFree(this.vtbl.get_EmailAddress)
        CallbackFree(this.vtbl.put_EmailAddress)
        CallbackFree(this.vtbl.get_HomeDirectory)
        CallbackFree(this.vtbl.put_HomeDirectory)
        CallbackFree(this.vtbl.get_Languages)
        CallbackFree(this.vtbl.put_Languages)
        CallbackFree(this.vtbl.get_Profile)
        CallbackFree(this.vtbl.put_Profile)
        CallbackFree(this.vtbl.get_LoginScript)
        CallbackFree(this.vtbl.put_LoginScript)
        CallbackFree(this.vtbl.get_Picture)
        CallbackFree(this.vtbl.put_Picture)
        CallbackFree(this.vtbl.get_HomePage)
        CallbackFree(this.vtbl.put_HomePage)
        CallbackFree(this.vtbl.Groups)
        CallbackFree(this.vtbl.SetPassword)
        CallbackFree(this.vtbl.ChangePassword)
    }
}
