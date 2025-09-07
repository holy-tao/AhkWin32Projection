#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

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
 * @version v4.0.30319
 * @charset Unicode
 */
class FAX_GLOBAL_ROUTING_INFOW extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * Type: <b>DWORD</b>
     * 
     * Specifies the size, in bytes, of the <b>FAX_GLOBAL_ROUTING_INFO</b> structure. The calling application must set this member to <b>sizeof(FAX_GLOBAL_ROUTING_INFO)</b> before it calls the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winfax/nf-winfax-faxsetglobalroutinginfoa">FaxSetGlobalRoutingInfo</a> function.
     * @type {Integer}
     */
    SizeOfStruct {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * Specifies a <b>DWORD</b> variable that indicates the priority of the fax routing method. The priority determines the relative order in which the fax service calls the fax routing methods when the service receives a fax document. Valid values for this member are 1 through n, where 1 is the highest priority.
     * @type {Integer}
     */
    Priority {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Type: <b>LPCTSTR</b>
     * 
     * Pointer to a constant null-terminated character string that specifies the GUID that uniquely identifies the fax routing method of interest. 
     * 
     *                     
     * 
     * For more information about fax routing methods, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-about-the-fax-routing-extension-api">About the Fax Routing Extension API</a>.
     * @type {PWSTR}
     */
    Guid{
        get {
            if(!this.HasProp("__Guid"))
                this.__Guid := PWSTR(this.ptr + 8)
            return this.__Guid
        }
    }

    /**
     * Type: <b>LPCTSTR</b>
     * 
     * Pointer to a constant null-terminated character string that specifies the user-friendly name to display for the fax routing method.
     * @type {PWSTR}
     */
    FriendlyName{
        get {
            if(!this.HasProp("__FriendlyName"))
                this.__FriendlyName := PWSTR(this.ptr + 16)
            return this.__FriendlyName
        }
    }

    /**
     * Type: <b>LPCTSTR</b>
     * 
     * Pointer to a constant null-terminated character string that is the name of the function that executes the specified fax routing method. The fax routing extension DLL identified by the <b>ExtensionImageName</b> member exports the function.
     * @type {PWSTR}
     */
    FunctionName{
        get {
            if(!this.HasProp("__FunctionName"))
                this.__FunctionName := PWSTR(this.ptr + 24)
            return this.__FunctionName
        }
    }

    /**
     * Type: <b>LPCTSTR</b>
     * 
     * Pointer to a constant null-terminated character string that specifies the name of the fax routing extension DLL that implements the fax routing method.
     * @type {PWSTR}
     */
    ExtensionImageName{
        get {
            if(!this.HasProp("__ExtensionImageName"))
                this.__ExtensionImageName := PWSTR(this.ptr + 32)
            return this.__ExtensionImageName
        }
    }

    /**
     * Type: <b>LPCTSTR</b>
     * 
     * Pointer to a constant null-terminated character string that specifies the user-friendly name to display for the fax routing extension DLL that implements the fax routing method.
     * @type {PWSTR}
     */
    ExtensionFriendlyName{
        get {
            if(!this.HasProp("__ExtensionFriendlyName"))
                this.__ExtensionFriendlyName := PWSTR(this.ptr + 40)
            return this.__ExtensionFriendlyName
        }
    }
}
