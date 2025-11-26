#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Variant\VARIANT.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * To the properties of a rule.
 * @remarks
 * 
 * Each time you change a property of a rule, Windows Firewall commits the rule and verifies it for correctness. As a result, when you edit a rule, you must perform the steps in a specific order. For example, if you add an ICMP rule, you must first set the protocol to ICMP, then add the rule. If these steps are taken in the opposite order, an error occurs and the change is lost.
 * 
 * If you are editing a TCP port rule and converting it into an ICMP rule, first delete the port, change protocol from TCP to ICMP, and then add the rule.
 * 
 * In order to  retrieve and modify existing rules, instances of this interface must be retrieved through <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netfw/nn-netfw-inetfwrules">INetFwRules</a>.  All configuration changes take place immediately.
 * 
 * When accessing the properties of a  	rule, keep in mind that there may be a small time lag before a newly-added rule is applied.
 * 
 * Properties are used to create firewall rules.  Many of the properties can be used in order to create very specific firewall rules.
 * 
 * <table>
 * <tr>
 * <th>Property</th>
 * <th>Type and format</th>
 * <th>Constraints</th>
 * </tr>
 * <tr>
 * <td>
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netfw/nf-netfw-inetfwrule-get_name">Name</a>
 * </td>
 * <td>Clear text string.</td>
 * <td>Required. The string must not contain a "|" and it must not be "all".</td>
 * </tr>
 * <tr>
 * <td>
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netfw/nf-netfw-inetfwrule-get_description">Description</a>
 * </td>
 * <td>Clear text string.</td>
 * <td>Optional. The string must not contain a "|".</td>
 * </tr>
 * <tr>
 * <td>
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netfw/nf-netfw-inetfwrule-get_grouping">Grouping</a>
 * </td>
 * <td>String in the format "@&lt;dll name&gt;, &lt;resource string identifier&gt;".</td>
 * <td>Required.</td>
 * </tr>
 * <tr>
 * <td>
 * <a href="https://docs.microsoft.com/windows/desktop/api/netfw/nf-netfw-inetfwrule-get_enabled">Enabled</a>
 * </td>
 * <td>Boolean (<b>VARIANT_BOOLEAN</b>).</td>
 * <td>Optional.  Defaults to false (<b>VARIANT_FALSE</b>) if nothing is specified.</td>
 * </tr>
 * <tr>
 * <td>
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netfw/nf-netfw-inetfwrule-get_applicationname">ApplicationName</a>
 * </td>
 * <td>Clear text string.</td>
 * <td>Optional.</td>
 * </tr>
 * <tr>
 * <td>
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netfw/nf-netfw-inetfwrule-get_servicename">ServiceName</a>
 * </td>
 * <td>Clear text string.</td>
 * <td>Optional.</td>
 * </tr>
 * <tr>
 * <td>
 * <a href="https://docs.microsoft.com/windows/desktop/api/netfw/nf-netfw-inetfwrule-get_localports">LocalPorts</a>
 * </td>
 * <td>Clear text string containing a list of port numbers.  "RPC" is an acceptable value.</td>
 * <td>Optional.</td>
 * </tr>
 * <tr>
 * <td>
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netfw/nf-netfw-inetfwrule-get_remoteports">RemotePorts</a>
 * </td>
 * <td>Clear text string containing a list of port numbers.</td>
 * <td>Optional.</td>
 * </tr>
 * <tr>
 * <td>
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netfw/nf-netfw-inetfwrule-get_localaddresses">LocalAddresses</a>
 * </td>
 * <td>Clear text string containing a list of IPv4 and IPv6 addresses separated by commas.  Range values and"*"are acceptable in this list.</td>
 * <td>Optional.</td>
 * </tr>
 * <tr>
 * <td>
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netfw/nf-netfw-inetfwrule-get_remoteaddresses">RemoteAddresses</a>
 * </td>
 * <td>Clear text string containing a list of IPv4 and IPv6 addresses separated by commas.  Range values and"*"are acceptable in this list.</td>
 * <td>Optional.</td>
 * </tr>
 * <tr>
 * <td>
 * <a href="https://docs.microsoft.com/windows/desktop/api/netfw/nf-netfw-inetfwrule-get_protocol">Protocol</a>
 * </td>
 * <td>Number.</td>
 * <td>Optional.</td>
 * </tr>
 * <tr>
 * <td>
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netfw/nf-netfw-inetfwrule-get_profiles">put_Profiles</a>
 * </td>
 * <td>String value in the format "type, code". Multiple types and codes can be included in the string by separating each pair with a ";".</td>
 * <td>Optional.</td>
 * </tr>
 * <tr>
 * <td>
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netfw/nf-netfw-inetfwrule-get_interfaces">Interfaces</a>
 * </td>
 * <td>Array of strings containing the friendly names of interfaces.</td>
 * <td>Optional.</td>
 * </tr>
 * <tr>
 * <td>
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netfw/nf-netfw-inetfwrule-get_interfacetypes">InterfaceTypes</a>
 * </td>
 * <td>String value. Multiple interface types can be included in the string by separating each value with a ",".  Acceptable values are "RemoteAccess", "Wireless", "Lan", and "All".</td>
 * <td>Optional.</td>
 * </tr>
 * <tr>
 * <td>
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netfw/nf-netfw-inetfwrule-get_direction">Direction</a>
 * </td>
 * <td>Enumeration.</td>
 * <td>Optional.  </td>
 * </tr>
 * <tr>
 * <td>
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netfw/nf-netfw-inetfwrule-get_action">Action</a>
 * </td>
 * <td>Enumeration.</td>
 * <td>Optional.</td>
 * </tr>
 * <tr>
 * <td>
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netfw/nf-netfw-inetfwrule-get_edgetraversal">EdgeTraversal</a>
 * </td>
 * <td>Boolean (<b>VARIANT_BOOLEAN</b>).</td>
 * <td>Optional.</td>
 * </tr>
 * <tr>
 * <td>
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netfw/nf-netfw-inetfwrule-get_profiles">Profiles</a>
 * </td>
 * <td>Enumeration.</td>
 * <td>Optional.</td>
 * </tr>
 * </table>
 *  
 * 
 * For additional information on each property, please see the corresponding topic.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//netfw/nn-netfw-inetfwrule
 * @namespace Windows.Win32.NetworkManagement.WindowsFirewall
 * @version v4.0.30319
 */
class INetFwRule extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for INetFwRule
     * @type {Guid}
     */
    static IID => Guid("{af230d27-baba-4e42-aced-f524f22cfce2}")

    /**
     * The class identifier for NetFwRule
     * @type {Guid}
     */
    static CLSID => Guid("{2c5bc43e-3369-4c33-ab0c-be9469677af4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Name", "put_Name", "get_Description", "put_Description", "get_ApplicationName", "put_ApplicationName", "get_ServiceName", "put_ServiceName", "get_Protocol", "put_Protocol", "get_LocalPorts", "put_LocalPorts", "get_RemotePorts", "put_RemotePorts", "get_LocalAddresses", "put_LocalAddresses", "get_RemoteAddresses", "put_RemoteAddresses", "get_IcmpTypesAndCodes", "put_IcmpTypesAndCodes", "get_Direction", "put_Direction", "get_Interfaces", "put_Interfaces", "get_InterfaceTypes", "put_InterfaceTypes", "get_Enabled", "put_Enabled", "get_Grouping", "put_Grouping", "get_Profiles", "put_Profiles", "get_EdgeTraversal", "put_EdgeTraversal", "get_Action", "put_Action"]

    /**
     * @type {BSTR} 
     */
    Name {
        get => this.get_Name()
        set => this.put_Name(value)
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
    ApplicationName {
        get => this.get_ApplicationName()
        set => this.put_ApplicationName(value)
    }

    /**
     * @type {BSTR} 
     */
    ServiceName {
        get => this.get_ServiceName()
        set => this.put_ServiceName(value)
    }

    /**
     * @type {Integer} 
     */
    Protocol {
        get => this.get_Protocol()
        set => this.put_Protocol(value)
    }

    /**
     * @type {BSTR} 
     */
    LocalPorts {
        get => this.get_LocalPorts()
        set => this.put_LocalPorts(value)
    }

    /**
     * @type {BSTR} 
     */
    RemotePorts {
        get => this.get_RemotePorts()
        set => this.put_RemotePorts(value)
    }

    /**
     * @type {BSTR} 
     */
    LocalAddresses {
        get => this.get_LocalAddresses()
        set => this.put_LocalAddresses(value)
    }

    /**
     * @type {BSTR} 
     */
    RemoteAddresses {
        get => this.get_RemoteAddresses()
        set => this.put_RemoteAddresses(value)
    }

    /**
     * @type {BSTR} 
     */
    IcmpTypesAndCodes {
        get => this.get_IcmpTypesAndCodes()
        set => this.put_IcmpTypesAndCodes(value)
    }

    /**
     * @type {Integer} 
     */
    Direction {
        get => this.get_Direction()
        set => this.put_Direction(value)
    }

    /**
     * @type {VARIANT} 
     */
    Interfaces {
        get => this.get_Interfaces()
        set => this.put_Interfaces(value)
    }

    /**
     * @type {BSTR} 
     */
    InterfaceTypes {
        get => this.get_InterfaceTypes()
        set => this.put_InterfaceTypes(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    Enabled {
        get => this.get_Enabled()
        set => this.put_Enabled(value)
    }

    /**
     * @type {BSTR} 
     */
    Grouping {
        get => this.get_Grouping()
        set => this.put_Grouping(value)
    }

    /**
     * @type {Integer} 
     */
    Profiles {
        get => this.get_Profiles()
        set => this.put_Profiles(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    EdgeTraversal {
        get => this.get_EdgeTraversal()
        set => this.put_EdgeTraversal(value)
    }

    /**
     * @type {Integer} 
     */
    Action {
        get => this.get_Action()
        set => this.put_Action(value)
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwrule-get_name
     */
    get_Name() {
        name := BSTR()
        result := ComCall(7, this, "ptr", name, "HRESULT")
        return name
    }

    /**
     * 
     * @param {BSTR} name 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwrule-put_name
     */
    put_Name(name) {
        name := name is String ? BSTR.Alloc(name).Value : name

        result := ComCall(8, this, "ptr", name, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwrule-get_description
     */
    get_Description() {
        desc := BSTR()
        result := ComCall(9, this, "ptr", desc, "HRESULT")
        return desc
    }

    /**
     * 
     * @param {BSTR} desc 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwrule-put_description
     */
    put_Description(desc) {
        desc := desc is String ? BSTR.Alloc(desc).Value : desc

        result := ComCall(10, this, "ptr", desc, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwrule-get_applicationname
     */
    get_ApplicationName() {
        imageFileName := BSTR()
        result := ComCall(11, this, "ptr", imageFileName, "HRESULT")
        return imageFileName
    }

    /**
     * 
     * @param {BSTR} imageFileName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwrule-put_applicationname
     */
    put_ApplicationName(imageFileName) {
        imageFileName := imageFileName is String ? BSTR.Alloc(imageFileName).Value : imageFileName

        result := ComCall(12, this, "ptr", imageFileName, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwrule-get_servicename
     */
    get_ServiceName() {
        serviceName := BSTR()
        result := ComCall(13, this, "ptr", serviceName, "HRESULT")
        return serviceName
    }

    /**
     * 
     * @param {BSTR} serviceName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwrule-put_servicename
     */
    put_ServiceName(serviceName) {
        serviceName := serviceName is String ? BSTR.Alloc(serviceName).Value : serviceName

        result := ComCall(14, this, "ptr", serviceName, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwrule-get_protocol
     */
    get_Protocol() {
        result := ComCall(15, this, "int*", &protocol := 0, "HRESULT")
        return protocol
    }

    /**
     * 
     * @param {Integer} protocol 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwrule-put_protocol
     */
    put_Protocol(protocol) {
        result := ComCall(16, this, "int", protocol, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwrule-get_localports
     */
    get_LocalPorts() {
        portNumbers := BSTR()
        result := ComCall(17, this, "ptr", portNumbers, "HRESULT")
        return portNumbers
    }

    /**
     * 
     * @param {BSTR} portNumbers 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwrule-put_localports
     */
    put_LocalPorts(portNumbers) {
        portNumbers := portNumbers is String ? BSTR.Alloc(portNumbers).Value : portNumbers

        result := ComCall(18, this, "ptr", portNumbers, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwrule-get_remoteports
     */
    get_RemotePorts() {
        portNumbers := BSTR()
        result := ComCall(19, this, "ptr", portNumbers, "HRESULT")
        return portNumbers
    }

    /**
     * 
     * @param {BSTR} portNumbers 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwrule-put_remoteports
     */
    put_RemotePorts(portNumbers) {
        portNumbers := portNumbers is String ? BSTR.Alloc(portNumbers).Value : portNumbers

        result := ComCall(20, this, "ptr", portNumbers, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwrule-get_localaddresses
     */
    get_LocalAddresses() {
        localAddrs := BSTR()
        result := ComCall(21, this, "ptr", localAddrs, "HRESULT")
        return localAddrs
    }

    /**
     * 
     * @param {BSTR} localAddrs 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwrule-put_localaddresses
     */
    put_LocalAddresses(localAddrs) {
        localAddrs := localAddrs is String ? BSTR.Alloc(localAddrs).Value : localAddrs

        result := ComCall(22, this, "ptr", localAddrs, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwrule-get_remoteaddresses
     */
    get_RemoteAddresses() {
        remoteAddrs := BSTR()
        result := ComCall(23, this, "ptr", remoteAddrs, "HRESULT")
        return remoteAddrs
    }

    /**
     * 
     * @param {BSTR} remoteAddrs 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwrule-put_remoteaddresses
     */
    put_RemoteAddresses(remoteAddrs) {
        remoteAddrs := remoteAddrs is String ? BSTR.Alloc(remoteAddrs).Value : remoteAddrs

        result := ComCall(24, this, "ptr", remoteAddrs, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwrule-get_icmptypesandcodes
     */
    get_IcmpTypesAndCodes() {
        icmpTypesAndCodes := BSTR()
        result := ComCall(25, this, "ptr", icmpTypesAndCodes, "HRESULT")
        return icmpTypesAndCodes
    }

    /**
     * 
     * @param {BSTR} icmpTypesAndCodes 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwrule-put_icmptypesandcodes
     */
    put_IcmpTypesAndCodes(icmpTypesAndCodes) {
        icmpTypesAndCodes := icmpTypesAndCodes is String ? BSTR.Alloc(icmpTypesAndCodes).Value : icmpTypesAndCodes

        result := ComCall(26, this, "ptr", icmpTypesAndCodes, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwrule-get_direction
     */
    get_Direction() {
        result := ComCall(27, this, "int*", &dir := 0, "HRESULT")
        return dir
    }

    /**
     * 
     * @param {Integer} dir 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwrule-put_direction
     */
    put_Direction(dir) {
        result := ComCall(28, this, "int", dir, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwrule-get_interfaces
     */
    get_Interfaces() {
        interfaces := VARIANT()
        result := ComCall(29, this, "ptr", interfaces, "HRESULT")
        return interfaces
    }

    /**
     * 
     * @param {VARIANT} interfaces 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwrule-put_interfaces
     */
    put_Interfaces(interfaces) {
        result := ComCall(30, this, "ptr", interfaces, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwrule-get_interfacetypes
     */
    get_InterfaceTypes() {
        interfaceTypes := BSTR()
        result := ComCall(31, this, "ptr", interfaceTypes, "HRESULT")
        return interfaceTypes
    }

    /**
     * 
     * @param {BSTR} interfaceTypes 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwrule-put_interfacetypes
     */
    put_InterfaceTypes(interfaceTypes) {
        interfaceTypes := interfaceTypes is String ? BSTR.Alloc(interfaceTypes).Value : interfaceTypes

        result := ComCall(32, this, "ptr", interfaceTypes, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwrule-get_enabled
     */
    get_Enabled() {
        result := ComCall(33, this, "short*", &enabled := 0, "HRESULT")
        return enabled
    }

    /**
     * 
     * @param {VARIANT_BOOL} enabled 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwrule-put_enabled
     */
    put_Enabled(enabled) {
        result := ComCall(34, this, "short", enabled, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwrule-get_grouping
     */
    get_Grouping() {
        context := BSTR()
        result := ComCall(35, this, "ptr", context, "HRESULT")
        return context
    }

    /**
     * 
     * @param {BSTR} context 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwrule-put_grouping
     */
    put_Grouping(context) {
        context := context is String ? BSTR.Alloc(context).Value : context

        result := ComCall(36, this, "ptr", context, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwrule-get_profiles
     */
    get_Profiles() {
        result := ComCall(37, this, "int*", &profileTypesBitmask := 0, "HRESULT")
        return profileTypesBitmask
    }

    /**
     * 
     * @param {Integer} profileTypesBitmask 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwrule-put_profiles
     */
    put_Profiles(profileTypesBitmask) {
        result := ComCall(38, this, "int", profileTypesBitmask, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwrule-get_edgetraversal
     */
    get_EdgeTraversal() {
        result := ComCall(39, this, "short*", &enabled := 0, "HRESULT")
        return enabled
    }

    /**
     * 
     * @param {VARIANT_BOOL} enabled 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwrule-put_edgetraversal
     */
    put_EdgeTraversal(enabled) {
        result := ComCall(40, this, "short", enabled, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwrule-get_action
     */
    get_Action() {
        result := ComCall(41, this, "int*", &action := 0, "HRESULT")
        return action
    }

    /**
     * 
     * @param {Integer} action 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwrule-put_action
     */
    put_Action(action) {
        result := ComCall(42, this, "int", action, "HRESULT")
        return result
    }
}
