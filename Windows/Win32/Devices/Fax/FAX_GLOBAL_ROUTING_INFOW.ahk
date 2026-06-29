#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * The FAX_GLOBAL_ROUTING_INFO structure contains information about one fax routing method, as it pertains globally to the fax service. (Unicode)
 * @remarks
 * A fax client application can call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winfax/nf-winfax-faxenumglobalroutinginfoa">FaxEnumGlobalRoutingInfo</a> function to retrieve fax routing method information that applies globally to the fax service. The function returns information about each fax routing method in an individual <b>FAX_GLOBAL_ROUTING_INFO</b> structure.
 * 
 * Call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winfax/nf-winfax-faxsetglobalroutinginfoa">FaxSetGlobalRoutingInfo</a> function to modify fax routing method data that applies globally to the fax server, such as routing priority.
 * 
 * For more information, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-managing-global-fax-routing-data">Managing Global Fax Routing Data</a>.
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The winfax.h header defines FAX_GLOBAL_ROUTING_INFO as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/winfax/ns-winfax-fax_global_routing_infow
 * @namespace Windows.Win32.Devices.Fax
 * @charset Unicode
 */
export default struct FAX_GLOBAL_ROUTING_INFOW {
    #StructPack 8

    /**
     * Type: <b>DWORD</b>
     * 
     * Specifies the size, in bytes, of the <b>FAX_GLOBAL_ROUTING_INFO</b> structure. The calling application must set this member to <b>sizeof(FAX_GLOBAL_ROUTING_INFO)</b> before it calls the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winfax/nf-winfax-faxsetglobalroutinginfoa">FaxSetGlobalRoutingInfo</a> function.
     */
    SizeOfStruct : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * Specifies a <b>DWORD</b> variable that indicates the priority of the fax routing method. The priority determines the relative order in which the fax service calls the fax routing methods when the service receives a fax document. Valid values for this member are 1 through n, where 1 is the highest priority.
     */
    Priority : UInt32

    /**
     * Type: <b>LPCTSTR</b>
     * 
     * Pointer to a constant null-terminated character string that specifies the GUID that uniquely identifies the fax routing method of interest. 
     * 
     *                     
     * 
     * For more information about fax routing methods, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-about-the-fax-routing-extension-api">About the Fax Routing Extension API</a>.
     */
    Guid : PWSTR

    /**
     * Type: <b>LPCTSTR</b>
     * 
     * Pointer to a constant null-terminated character string that specifies the user-friendly name to display for the fax routing method.
     */
    FriendlyName : PWSTR

    /**
     * Type: <b>LPCTSTR</b>
     * 
     * Pointer to a constant null-terminated character string that is the name of the function that executes the specified fax routing method. The fax routing extension DLL identified by the <b>ExtensionImageName</b> member exports the function.
     */
    FunctionName : PWSTR

    /**
     * Type: <b>LPCTSTR</b>
     * 
     * Pointer to a constant null-terminated character string that specifies the name of the fax routing extension DLL that implements the fax routing method.
     */
    ExtensionImageName : PWSTR

    /**
     * Type: <b>LPCTSTR</b>
     * 
     * Pointer to a constant null-terminated character string that specifies the user-friendly name to display for the fax routing extension DLL that implements the fax routing method.
     */
    ExtensionFriendlyName : PWSTR

}
