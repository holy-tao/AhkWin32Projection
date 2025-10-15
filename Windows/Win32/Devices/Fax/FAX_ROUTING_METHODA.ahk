#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOL.ahk
#Include ..\..\Foundation\PSTR.ahk

/**
 * The FAX_ROUTING_METHOD structure contains information about one fax routing method, as it pertains to one fax device.
 * @remarks
 * 
  * A fax client application can call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winfax/nf-winfax-faxenumroutingmethodsa">FaxEnumRoutingMethods</a> function to enumerate all the fax routing methods associated with a specific fax device. The function returns an array of <b>FAX_ROUTING_METHOD</b> structures. Each structure describes one fax routing method in detail.
  * 
  * Call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winfax/nf-winfax-faxenableroutingmethoda">FaxEnableRoutingMethod</a> function to enable or disable a fax routing method for a specific fax device.
  * 
  * For more information, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-managing-fax-routing-data">Managing Fax Routing Data</a>.
  * 
  * 
  * 
  * 
  * 
  * > [!NOTE]
  * > The winfax.h header defines FAX_ROUTING_METHOD as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//winfax/ns-winfax-fax_routing_methoda
 * @namespace Windows.Win32.Devices.Fax
 * @version v4.0.30319
 * @charset ANSI
 */
class FAX_ROUTING_METHODA extends Win32Struct
{
    static sizeof => 64

    static packingSize => 8

    /**
     * Type: <b>DWORD</b>
     * 
     * Specifies the size, in bytes, of the <b>FAX_ROUTING_METHOD</b> structure. The fax service sets this member to <b>sizeof(FAX_ROUTING_METHOD)</b>.
     * @type {Integer}
     */
    SizeOfStruct {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * Specifies a <b>DWORD</b> variable that indicates the permanent line identifier for the fax device of interest.
     * @type {Integer}
     */
    DeviceId {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Type: <b>BOOL</b>
     * 
     * Specifies a Boolean variable that indicates whether the fax routing method is enabled or disabled for the fax device of interest. If this parameter is equal to <b>TRUE</b>, the fax routing method is enabled for the device.
     * @type {BOOL}
     */
    Enabled{
        get {
            if(!this.HasProp("__Enabled"))
                this.__Enabled := BOOL(this.ptr + 8)
            return this.__Enabled
        }
    }

    /**
     * Type: <b>LPCTSTR</b>
     * 
     * Pointer to a constant null-terminated character string that specifies the name of the fax device of interest.
     * @type {PSTR}
     */
    DeviceName{
        get {
            if(!this.HasProp("__DeviceName"))
                this.__DeviceName := PSTR(this.ptr + 16)
            return this.__DeviceName
        }
    }

    /**
     * Type: <b>LPCTSTR</b>
     * 
     * Pointer to a constant null-terminated character string that specifies the GUID that uniquely identifies the fax routing method of interest. 
     *                 
     *                     
     * 
     * For more information about fax routing methods, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-about-the-fax-routing-extension-api">About the Fax Routing Extension API</a>.
     * @type {PSTR}
     */
    Guid{
        get {
            if(!this.HasProp("__Guid"))
                this.__Guid := PSTR(this.ptr + 24)
            return this.__Guid
        }
    }

    /**
     * Type: <b>LPCTSTR</b>
     * 
     * Pointer to a constant null-terminated character string that specifies the user-friendly name to display for the fax routing method.
     * @type {PSTR}
     */
    FriendlyName{
        get {
            if(!this.HasProp("__FriendlyName"))
                this.__FriendlyName := PSTR(this.ptr + 32)
            return this.__FriendlyName
        }
    }

    /**
     * Type: <b>LPCTSTR</b>
     * 
     * Pointer to a constant null-terminated character string that is the name of the function that executes the specified fax routing procedure. The fax routing extension DLL identified by the <b>ExtensionImageName</b> member exports the function.
     * @type {PSTR}
     */
    FunctionName{
        get {
            if(!this.HasProp("__FunctionName"))
                this.__FunctionName := PSTR(this.ptr + 40)
            return this.__FunctionName
        }
    }

    /**
     * Type: <b>LPCTSTR</b>
     * 
     * Pointer to a constant null-terminated character string that specifies the name of the fax routing extension DLL that implements the fax routing method.
     * @type {PSTR}
     */
    ExtensionImageName{
        get {
            if(!this.HasProp("__ExtensionImageName"))
                this.__ExtensionImageName := PSTR(this.ptr + 48)
            return this.__ExtensionImageName
        }
    }

    /**
     * Type: <b>LPCTSTR</b>
     * 
     * Pointer to a constant null-terminated character string that specifies the user-friendly name to display for the fax routing extension DLL.
     * @type {PSTR}
     */
    ExtensionFriendlyName{
        get {
            if(!this.HasProp("__ExtensionFriendlyName"))
                this.__ExtensionFriendlyName := PSTR(this.ptr + 56)
            return this.__ExtensionFriendlyName
        }
    }
}
