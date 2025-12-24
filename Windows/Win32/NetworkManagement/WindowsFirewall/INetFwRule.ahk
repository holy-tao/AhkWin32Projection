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
     * Specifies the friendly name of this rule.
     * @remarks
     * 
     * This property is required. The string must not contain the "|" character.
     * 
     * Also see the restrictions on changing properties described in the Remarks section of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netfw/nn-netfw-inetfwrule">INetFwRule</a> interface page.
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//netfw/nf-netfw-inetfwrule-get_name
     */
    get_Name() {
        name := BSTR()
        result := ComCall(7, this, "ptr", name, "HRESULT")
        return name
    }

    /**
     * Specifies the friendly name of this rule.
     * @remarks
     * 
     * This property is required. The string must not contain the "|" character.
     * 
     * Also see the restrictions on changing properties described in the Remarks section of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netfw/nn-netfw-inetfwrule">INetFwRule</a> interface page.
     * 
     * 
     * @param {BSTR} name 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//netfw/nf-netfw-inetfwrule-put_name
     */
    put_Name(name) {
        name := name is String ? BSTR.Alloc(name).Value : name

        result := ComCall(8, this, "ptr", name, "HRESULT")
        return result
    }

    /**
     * Specifies the description of this rule.
     * @remarks
     * 
     * This property is optional. The string must not contain the "|" character.
     * 
     * Also see the restrictions on changing properties described in the Remarks section of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netfw/nn-netfw-inetfwrule">INetFwRule</a> interface page.
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//netfw/nf-netfw-inetfwrule-get_description
     */
    get_Description() {
        desc := BSTR()
        result := ComCall(9, this, "ptr", desc, "HRESULT")
        return desc
    }

    /**
     * Specifies the description of this rule.
     * @remarks
     * 
     * This property is optional. The string must not contain the "|" character.
     * 
     * Also see the restrictions on changing properties described in the Remarks section of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netfw/nn-netfw-inetfwrule">INetFwRule</a> interface page.
     * 
     * 
     * @param {BSTR} desc 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//netfw/nf-netfw-inetfwrule-put_description
     */
    put_Description(desc) {
        desc := desc is String ? BSTR.Alloc(desc).Value : desc

        result := ComCall(10, this, "ptr", desc, "HRESULT")
        return result
    }

    /**
     * Specifies the friendly name of the application to which this rule applies.
     * @remarks
     * 
     * This property is optional.
     * 
     * Also see the restrictions on changing properties described in the Remarks section of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netfw/nn-netfw-inetfwrule">INetFwRule</a> interface page.
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//netfw/nf-netfw-inetfwrule-get_applicationname
     */
    get_ApplicationName() {
        imageFileName := BSTR()
        result := ComCall(11, this, "ptr", imageFileName, "HRESULT")
        return imageFileName
    }

    /**
     * Specifies the friendly name of the application to which this rule applies.
     * @remarks
     * 
     * This property is optional.
     * 
     * Also see the restrictions on changing properties described in the Remarks section of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netfw/nn-netfw-inetfwrule">INetFwRule</a> interface page.
     * 
     * 
     * @param {BSTR} imageFileName 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//netfw/nf-netfw-inetfwrule-put_applicationname
     */
    put_ApplicationName(imageFileName) {
        imageFileName := imageFileName is String ? BSTR.Alloc(imageFileName).Value : imageFileName

        result := ComCall(12, this, "ptr", imageFileName, "HRESULT")
        return result
    }

    /**
     * Specifies the service name property of the application.
     * @remarks
     * 
     * This property is optional. A serviceName value of "*" indicates that a service, not an application,  must be sending or receiving traffic.
     * 
     * Also see the restrictions on changing properties described in the Remarks section of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netfw/nn-netfw-inetfwrule">INetFwRule</a> interface page.
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//netfw/nf-netfw-inetfwrule-get_servicename
     */
    get_ServiceName() {
        serviceName := BSTR()
        result := ComCall(13, this, "ptr", serviceName, "HRESULT")
        return serviceName
    }

    /**
     * Specifies the service name property of the application.
     * @remarks
     * 
     * This property is optional. A serviceName value of "*" indicates that a service, not an application,  must be sending or receiving traffic.
     * 
     * Also see the restrictions on changing properties described in the Remarks section of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netfw/nn-netfw-inetfwrule">INetFwRule</a> interface page.
     * 
     * 
     * @param {BSTR} serviceName 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//netfw/nf-netfw-inetfwrule-put_servicename
     */
    put_ServiceName(serviceName) {
        serviceName := serviceName is String ? BSTR.Alloc(serviceName).Value : serviceName

        result := ComCall(14, this, "ptr", serviceName, "HRESULT")
        return result
    }

    /**
     * Specifies the IP protocol of this rule.
     * @remarks
     * 
     * This property is optional.
     * 
     * Also see the restrictions on changing properties described in the Remarks section of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netfw/nn-netfw-inetfwrule">INetFwRule</a> interface page.
     * 
     * The <b>Protocol</b> property must be set before the <a href="https://docs.microsoft.com/windows/desktop/api/netfw/nf-netfw-inetfwrule-get_localports">LocalPorts</a> or <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netfw/nf-netfw-inetfwrule-get_remoteports">RemotePorts</a> properties or an error will be returned.
     * 
     * A list of protocol numbers is available at the  <a href="https://www.iana.org/assignments/protocol-numbers/protocol-numbers.xml">IANA website</a>.
     * 
     * 
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//netfw/nf-netfw-inetfwrule-get_protocol
     */
    get_Protocol() {
        result := ComCall(15, this, "int*", &protocol := 0, "HRESULT")
        return protocol
    }

    /**
     * Specifies the IP protocol of this rule.
     * @remarks
     * 
     * This property is optional.
     * 
     * Also see the restrictions on changing properties described in the Remarks section of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netfw/nn-netfw-inetfwrule">INetFwRule</a> interface page.
     * 
     * The <b>Protocol</b> property must be set before the <a href="https://docs.microsoft.com/windows/desktop/api/netfw/nf-netfw-inetfwrule-get_localports">LocalPorts</a> or <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netfw/nf-netfw-inetfwrule-get_remoteports">RemotePorts</a> properties or an error will be returned.
     * 
     * A list of protocol numbers is available at the  <a href="https://www.iana.org/assignments/protocol-numbers/protocol-numbers.xml">IANA website</a>.
     * 
     * 
     * @param {Integer} protocol 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//netfw/nf-netfw-inetfwrule-put_protocol
     */
    put_Protocol(protocol) {
        result := ComCall(16, this, "int", protocol, "HRESULT")
        return result
    }

    /**
     * Specifies the list of local ports for this rule.
     * @remarks
     * 
     * This property is optional.
     * 
     * Also see the restrictions on changing properties described in the Remarks section of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netfw/nn-netfw-inetfwrule">INetFwRule</a> interface page.
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/netfw/nf-netfw-inetfwrule-get_protocol">Protocol</a> property must be set before the <b>LocalPorts</b> property or an error will be returned.
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//netfw/nf-netfw-inetfwrule-get_localports
     */
    get_LocalPorts() {
        portNumbers := BSTR()
        result := ComCall(17, this, "ptr", portNumbers, "HRESULT")
        return portNumbers
    }

    /**
     * Specifies the list of local ports for this rule.
     * @remarks
     * 
     * This property is optional.
     * 
     * Also see the restrictions on changing properties described in the Remarks section of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netfw/nn-netfw-inetfwrule">INetFwRule</a> interface page.
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/netfw/nf-netfw-inetfwrule-get_protocol">Protocol</a> property must be set before the <b>LocalPorts</b> property or an error will be returned.
     * 
     * 
     * @param {BSTR} portNumbers 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//netfw/nf-netfw-inetfwrule-put_localports
     */
    put_LocalPorts(portNumbers) {
        portNumbers := portNumbers is String ? BSTR.Alloc(portNumbers).Value : portNumbers

        result := ComCall(18, this, "ptr", portNumbers, "HRESULT")
        return result
    }

    /**
     * Specifies the list of remote ports for this rule.
     * @remarks
     * 
     * This property is optional.
     * 
     * Also see the restrictions on changing properties described in the Remarks section of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netfw/nn-netfw-inetfwrule">INetFwRule</a> interface page.
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/netfw/nf-netfw-inetfwrule-get_protocol">Protocol</a> property must be set before the <b>RemotePorts</b> property or an error will be returned.
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//netfw/nf-netfw-inetfwrule-get_remoteports
     */
    get_RemotePorts() {
        portNumbers := BSTR()
        result := ComCall(19, this, "ptr", portNumbers, "HRESULT")
        return portNumbers
    }

    /**
     * Specifies the list of remote ports for this rule.
     * @remarks
     * 
     * This property is optional.
     * 
     * Also see the restrictions on changing properties described in the Remarks section of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netfw/nn-netfw-inetfwrule">INetFwRule</a> interface page.
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/netfw/nf-netfw-inetfwrule-get_protocol">Protocol</a> property must be set before the <b>RemotePorts</b> property or an error will be returned.
     * 
     * 
     * @param {BSTR} portNumbers 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//netfw/nf-netfw-inetfwrule-put_remoteports
     */
    put_RemotePorts(portNumbers) {
        portNumbers := portNumbers is String ? BSTR.Alloc(portNumbers).Value : portNumbers

        result := ComCall(20, this, "ptr", portNumbers, "HRESULT")
        return result
    }

    /**
     * Specifies the list of local addresses for this rule.
     * @remarks
     * 
     * This property is optional.
     * 
     * Also see the restrictions on changing properties described in the Remarks section of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netfw/nn-netfw-inetfwrule">INetFwRule</a> interface page.
     * 
     * The <i>localAddrs</i> parameter consists of one or more comma-delimited tokens specifying the local addresses from which the application can listen for traffic.  "*" is the default value. Valid tokens include:
     * 
     * <ul>
     * <li>"*" indicates any local address.  If present, this must be the only token included.</li>
     * <li>"Defaultgateway"</li>
     * <li>"DHCP"</li>
     * <li>"WINS"</li>
     * <li>"LocalSubnet" indicates any local address on the local subnet.  This token is not case-sensitive.</li>
     * <li>A subnet can be specified using either the subnet mask or network prefix notation.  If neither a subnet mask not a network prefix is specified, the subnet mask defaults to 255.255.255.255.</li>
     * <li>A valid IPv6 address.</li>
     * <li>An IPv4 address range in the format of "start address - end address" with no spaces included.</li>
     * <li>An IPv6 address range in the format of "start address - end address" with no spaces included.</li>
     * </ul>
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//netfw/nf-netfw-inetfwrule-get_localaddresses
     */
    get_LocalAddresses() {
        localAddrs := BSTR()
        result := ComCall(21, this, "ptr", localAddrs, "HRESULT")
        return localAddrs
    }

    /**
     * Specifies the list of local addresses for this rule.
     * @remarks
     * 
     * This property is optional.
     * 
     * Also see the restrictions on changing properties described in the Remarks section of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netfw/nn-netfw-inetfwrule">INetFwRule</a> interface page.
     * 
     * The <i>localAddrs</i> parameter consists of one or more comma-delimited tokens specifying the local addresses from which the application can listen for traffic.  "*" is the default value. Valid tokens include:
     * 
     * <ul>
     * <li>"*" indicates any local address.  If present, this must be the only token included.</li>
     * <li>"Defaultgateway"</li>
     * <li>"DHCP"</li>
     * <li>"WINS"</li>
     * <li>"LocalSubnet" indicates any local address on the local subnet.  This token is not case-sensitive.</li>
     * <li>A subnet can be specified using either the subnet mask or network prefix notation.  If neither a subnet mask not a network prefix is specified, the subnet mask defaults to 255.255.255.255.</li>
     * <li>A valid IPv6 address.</li>
     * <li>An IPv4 address range in the format of "start address - end address" with no spaces included.</li>
     * <li>An IPv6 address range in the format of "start address - end address" with no spaces included.</li>
     * </ul>
     * 
     * 
     * @param {BSTR} localAddrs 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//netfw/nf-netfw-inetfwrule-put_localaddresses
     */
    put_LocalAddresses(localAddrs) {
        localAddrs := localAddrs is String ? BSTR.Alloc(localAddrs).Value : localAddrs

        result := ComCall(22, this, "ptr", localAddrs, "HRESULT")
        return result
    }

    /**
     * Specifies the list of remote addresses for this rule.
     * @remarks
     * 
     * This property is optional.
     * 
     * Also see the restrictions on changing properties described in the Remarks section of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netfw/nn-netfw-inetfwrule">INetFwRule</a> interface page.
     * 
     * The <i>remoteAddrs</i> parameter consists of one or more comma-delimited tokens specifying the remote addresses from which the application can listen for traffic.  The default value is "*". Valid tokens include:
     * 
     * <ul>
     * <li>"*" indicates any remote address.  If present, this must be the only token included.</li>
     * <li>"Defaultgateway"</li>
     * <li>"DHCP"</li>
     * <li>"DNS"</li>
     * <li>"WINS"</li>
     * <li>"LocalSubnet" indicates any local address on the local subnet.  This token is not case-sensitive.</li>
     * <li>A subnet can be specified using either the subnet mask or network prefix notation.  If neither a subnet mask not a network prefix is specified, the subnet mask defaults to 255.255.255.255.</li>
     * <li>A valid IPv6 address.</li>
     * <li>An IPv4 address range in the format of "start address - end address" with no spaces included.</li>
     * <li>An IPv6 address range in the format of "start address - end address" with no spaces included.</li>
     * </ul>
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//netfw/nf-netfw-inetfwrule-get_remoteaddresses
     */
    get_RemoteAddresses() {
        remoteAddrs := BSTR()
        result := ComCall(23, this, "ptr", remoteAddrs, "HRESULT")
        return remoteAddrs
    }

    /**
     * Specifies the list of remote addresses for this rule.
     * @remarks
     * 
     * This property is optional.
     * 
     * Also see the restrictions on changing properties described in the Remarks section of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netfw/nn-netfw-inetfwrule">INetFwRule</a> interface page.
     * 
     * The <i>remoteAddrs</i> parameter consists of one or more comma-delimited tokens specifying the remote addresses from which the application can listen for traffic.  The default value is "*". Valid tokens include:
     * 
     * <ul>
     * <li>"*" indicates any remote address.  If present, this must be the only token included.</li>
     * <li>"Defaultgateway"</li>
     * <li>"DHCP"</li>
     * <li>"DNS"</li>
     * <li>"WINS"</li>
     * <li>"LocalSubnet" indicates any local address on the local subnet.  This token is not case-sensitive.</li>
     * <li>A subnet can be specified using either the subnet mask or network prefix notation.  If neither a subnet mask not a network prefix is specified, the subnet mask defaults to 255.255.255.255.</li>
     * <li>A valid IPv6 address.</li>
     * <li>An IPv4 address range in the format of "start address - end address" with no spaces included.</li>
     * <li>An IPv6 address range in the format of "start address - end address" with no spaces included.</li>
     * </ul>
     * 
     * 
     * @param {BSTR} remoteAddrs 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//netfw/nf-netfw-inetfwrule-put_remoteaddresses
     */
    put_RemoteAddresses(remoteAddrs) {
        remoteAddrs := remoteAddrs is String ? BSTR.Alloc(remoteAddrs).Value : remoteAddrs

        result := ComCall(24, this, "ptr", remoteAddrs, "HRESULT")
        return result
    }

    /**
     * Specifies the list of ICMP types and codes for this rule.
     * @remarks
     * 
     * This property is optional.
     * 
     * Also see the restrictions on changing properties described in the Remarks section of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netfw/nn-netfw-inetfwrule">INetFwRule</a> interface page.
     * 
     * The <i>icmpTypesAndCodes</i> parameter is a list of ICMP types and codes     separated by semicolon. "*" indicates all ICMP types and codes.
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//netfw/nf-netfw-inetfwrule-get_icmptypesandcodes
     */
    get_IcmpTypesAndCodes() {
        icmpTypesAndCodes := BSTR()
        result := ComCall(25, this, "ptr", icmpTypesAndCodes, "HRESULT")
        return icmpTypesAndCodes
    }

    /**
     * Specifies the list of ICMP types and codes for this rule.
     * @remarks
     * 
     * This property is optional.
     * 
     * Also see the restrictions on changing properties described in the Remarks section of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netfw/nn-netfw-inetfwrule">INetFwRule</a> interface page.
     * 
     * The <i>icmpTypesAndCodes</i> parameter is a list of ICMP types and codes     separated by semicolon. "*" indicates all ICMP types and codes.
     * 
     * 
     * @param {BSTR} icmpTypesAndCodes 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//netfw/nf-netfw-inetfwrule-put_icmptypesandcodes
     */
    put_IcmpTypesAndCodes(icmpTypesAndCodes) {
        icmpTypesAndCodes := icmpTypesAndCodes is String ? BSTR.Alloc(icmpTypesAndCodes).Value : icmpTypesAndCodes

        result := ComCall(26, this, "ptr", icmpTypesAndCodes, "HRESULT")
        return result
    }

    /**
     * Specifies the direction of traffic for which the rule applies.
     * @remarks
     * 
     * This property is optional.  If this property is not specified, the default value is <b>in</b>.
     * 
     * Also see the restrictions on changing properties described in the Remarks section of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netfw/nn-netfw-inetfwrule">INetFwRule</a> interface page.
     * 
     * 
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//netfw/nf-netfw-inetfwrule-get_direction
     */
    get_Direction() {
        result := ComCall(27, this, "int*", &dir := 0, "HRESULT")
        return dir
    }

    /**
     * Specifies the direction of traffic for which the rule applies.
     * @remarks
     * 
     * This property is optional.  If this property is not specified, the default value is <b>in</b>.
     * 
     * Also see the restrictions on changing properties described in the Remarks section of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netfw/nn-netfw-inetfwrule">INetFwRule</a> interface page.
     * 
     * 
     * @param {Integer} dir 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//netfw/nf-netfw-inetfwrule-put_direction
     */
    put_Direction(dir) {
        result := ComCall(28, this, "int", dir, "HRESULT")
        return result
    }

    /**
     * Specifies the list of interfaces for which the rule applies.
     * @remarks
     * 
     * This property is optional.  The interfaces in the list are represented by their friendly name. 
     * 
     * Also see the restrictions on changing properties described in the Remarks section of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netfw/nn-netfw-inetfwrule">INetFwRule</a> interface page.
     * 
     * 
     * @returns {VARIANT} 
     * @see https://docs.microsoft.com/windows/win32/api//netfw/nf-netfw-inetfwrule-get_interfaces
     */
    get_Interfaces() {
        interfaces := VARIANT()
        result := ComCall(29, this, "ptr", interfaces, "HRESULT")
        return interfaces
    }

    /**
     * Specifies the list of interfaces for which the rule applies.
     * @remarks
     * 
     * This property is optional.  The interfaces in the list are represented by their friendly name. 
     * 
     * Also see the restrictions on changing properties described in the Remarks section of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netfw/nn-netfw-inetfwrule">INetFwRule</a> interface page.
     * 
     * 
     * @param {VARIANT} interfaces 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//netfw/nf-netfw-inetfwrule-put_interfaces
     */
    put_Interfaces(interfaces) {
        result := ComCall(30, this, "ptr", interfaces, "HRESULT")
        return result
    }

    /**
     * Specifies the list of interface types for which the rule applies.
     * @remarks
     * 
     * This property is optional.
     * 
     * Also see the restrictions on changing properties described in the Remarks section of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netfw/nn-netfw-inetfwrule">INetFwRule</a> interface page.
     * 
     * Acceptable values for this property are "RemoteAccess", "Wireless", "Lan", and "All". If more than one interface type is specified, the strings must be separated by a comma.
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//netfw/nf-netfw-inetfwrule-get_interfacetypes
     */
    get_InterfaceTypes() {
        interfaceTypes := BSTR()
        result := ComCall(31, this, "ptr", interfaceTypes, "HRESULT")
        return interfaceTypes
    }

    /**
     * Specifies the list of interface types for which the rule applies.
     * @remarks
     * 
     * This property is optional.
     * 
     * Also see the restrictions on changing properties described in the Remarks section of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netfw/nn-netfw-inetfwrule">INetFwRule</a> interface page.
     * 
     * Acceptable values for this property are "RemoteAccess", "Wireless", "Lan", and "All". If more than one interface type is specified, the strings must be separated by a comma.
     * 
     * 
     * @param {BSTR} interfaceTypes 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//netfw/nf-netfw-inetfwrule-put_interfacetypes
     */
    put_InterfaceTypes(interfaceTypes) {
        interfaceTypes := interfaceTypes is String ? BSTR.Alloc(interfaceTypes).Value : interfaceTypes

        result := ComCall(32, this, "ptr", interfaceTypes, "HRESULT")
        return result
    }

    /**
     * Enables or disables a rule.
     * @remarks
     * 
     * This property is optional.  A new rule is disabled by default.
     * 
     * Also see the restrictions on changing properties described in the Remarks section of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netfw/nn-netfw-inetfwrule">INetFwRule</a> interface page.
     * 
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//netfw/nf-netfw-inetfwrule-get_enabled
     */
    get_Enabled() {
        result := ComCall(33, this, "short*", &enabled := 0, "HRESULT")
        return enabled
    }

    /**
     * Enables or disables a rule.
     * @remarks
     * 
     * This property is optional.  A new rule is disabled by default.
     * 
     * Also see the restrictions on changing properties described in the Remarks section of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netfw/nn-netfw-inetfwrule">INetFwRule</a> interface page.
     * 
     * 
     * @param {VARIANT_BOOL} enabled 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//netfw/nf-netfw-inetfwrule-put_enabled
     */
    put_Enabled(enabled) {
        result := ComCall(34, this, "short", enabled, "HRESULT")
        return result
    }

    /**
     * Specifies the group to which an individual rule belongs.
     * @remarks
     * 
     * This property is optional.
     * 
     * Also see the restrictions on changing properties described in the Remarks section of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netfw/nn-netfw-inetfwrule">INetFwRule</a> interface page.
     * 
     * Using the Grouping property is highly recommended, as it groups multiple rules into a single line in the Windows Firewall control panel. This allows the user to enable or disable multiple rules with a single click. The Grouping property can also be specified using indirect strings. In this case, a group description can also be specified that will appear in the rule group properties in the Windows Firewall control panel. For example, if the group string is specified by an indirect string at index 1005 ("@yourresources.dll,-1005"), the group description can be specified at a resource string higher by 10000 "@youresources.dll,-11005."
     * 
     * When indirect strings in the form of "h" are passed as parameters to the Windows Firewall with Advanced Security APIs, they should either be placed under the System32 Windows directory or specified by a full path.  Further, the file should have a secure access that permits the Local Service account read access to allow the Windows Firewall Service to read the strings.  To avoid non-privileged security principals from modifying the strings, the DLLs should only allow write access to the Administrator account.
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//netfw/nf-netfw-inetfwrule-get_grouping
     */
    get_Grouping() {
        context := BSTR()
        result := ComCall(35, this, "ptr", context, "HRESULT")
        return context
    }

    /**
     * Specifies the group to which an individual rule belongs.
     * @remarks
     * 
     * This property is optional.
     * 
     * Also see the restrictions on changing properties described in the Remarks section of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netfw/nn-netfw-inetfwrule">INetFwRule</a> interface page.
     * 
     * Using the Grouping property is highly recommended, as it groups multiple rules into a single line in the Windows Firewall control panel. This allows the user to enable or disable multiple rules with a single click. The Grouping property can also be specified using indirect strings. In this case, a group description can also be specified that will appear in the rule group properties in the Windows Firewall control panel. For example, if the group string is specified by an indirect string at index 1005 ("@yourresources.dll,-1005"), the group description can be specified at a resource string higher by 10000 "@youresources.dll,-11005."
     * 
     * When indirect strings in the form of "h" are passed as parameters to the Windows Firewall with Advanced Security APIs, they should either be placed under the System32 Windows directory or specified by a full path.  Further, the file should have a secure access that permits the Local Service account read access to allow the Windows Firewall Service to read the strings.  To avoid non-privileged security principals from modifying the strings, the DLLs should only allow write access to the Administrator account.
     * 
     * 
     * @param {BSTR} context 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//netfw/nf-netfw-inetfwrule-put_grouping
     */
    put_Grouping(context) {
        context := context is String ? BSTR.Alloc(context).Value : context

        result := ComCall(36, this, "ptr", context, "HRESULT")
        return result
    }

    /**
     * Specifies the profiles to which the rule belongs.
     * @remarks
     * 
     * This property is optional.
     * 
     * Also see the restrictions on changing properties described in the Remarks section of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netfw/nn-netfw-inetfwrule">INetFwRule</a> interface page.
     * 
     * 
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//netfw/nf-netfw-inetfwrule-get_profiles
     */
    get_Profiles() {
        result := ComCall(37, this, "int*", &profileTypesBitmask := 0, "HRESULT")
        return profileTypesBitmask
    }

    /**
     * Specifies the profiles to which the rule belongs.
     * @remarks
     * 
     * This property is optional.
     * 
     * Also see the restrictions on changing properties described in the Remarks section of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netfw/nn-netfw-inetfwrule">INetFwRule</a> interface page.
     * 
     * 
     * @param {Integer} profileTypesBitmask 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//netfw/nf-netfw-inetfwrule-put_profiles
     */
    put_Profiles(profileTypesBitmask) {
        result := ComCall(38, this, "int", profileTypesBitmask, "HRESULT")
        return result
    }

    /**
     * Indicates whether edge traversal is enabled or disabled for this rule.
     * @remarks
     * 
     * The EdgeTraversal property indicates that specific inbound traffic is allowed to tunnel through NATs and other edge devices using the Teredo tunneling technology.  In order for this setting to work correctly, the application or service with the inbound firewall rule needs to support IPv6.  The primary application of this setting allows listeners on the host to be globally addressable through a Teredo IPv6 address.
     * 
     * New rules have the EdgeTraversal property disabled by default.
     * 
     * Also see the restrictions on changing properties described in the Remarks section of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netfw/nn-netfw-inetfwrule">INetFwRule</a> interface page.
     * 
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//netfw/nf-netfw-inetfwrule-get_edgetraversal
     */
    get_EdgeTraversal() {
        result := ComCall(39, this, "short*", &enabled := 0, "HRESULT")
        return enabled
    }

    /**
     * Indicates whether edge traversal is enabled or disabled for this rule.
     * @remarks
     * 
     * The EdgeTraversal property indicates that specific inbound traffic is allowed to tunnel through NATs and other edge devices using the Teredo tunneling technology.  In order for this setting to work correctly, the application or service with the inbound firewall rule needs to support IPv6.  The primary application of this setting allows listeners on the host to be globally addressable through a Teredo IPv6 address.
     * 
     * New rules have the EdgeTraversal property disabled by default.
     * 
     * Also see the restrictions on changing properties described in the Remarks section of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netfw/nn-netfw-inetfwrule">INetFwRule</a> interface page.
     * 
     * 
     * @param {VARIANT_BOOL} enabled 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//netfw/nf-netfw-inetfwrule-put_edgetraversal
     */
    put_EdgeTraversal(enabled) {
        result := ComCall(40, this, "short", enabled, "HRESULT")
        return result
    }

    /**
     * Specifies the action for a rule or default setting.
     * @remarks
     * 
     * This property is optional.
     * 
     * Also see the restrictions on changing properties described in the Remarks section of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netfw/nn-netfw-inetfwrule">INetFwRule</a> interface page.
     * 
     * 
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//netfw/nf-netfw-inetfwrule-get_action
     */
    get_Action() {
        result := ComCall(41, this, "int*", &action := 0, "HRESULT")
        return action
    }

    /**
     * Specifies the action for a rule or default setting.
     * @remarks
     * 
     * This property is optional.
     * 
     * Also see the restrictions on changing properties described in the Remarks section of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netfw/nn-netfw-inetfwrule">INetFwRule</a> interface page.
     * 
     * 
     * @param {Integer} action 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//netfw/nf-netfw-inetfwrule-put_action
     */
    put_Action(action) {
        result := ComCall(42, this, "int", action, "HRESULT")
        return result
    }
}
