#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\HDEVINFO.ahk

/**
 * An SP_PROPSHEETPAGE_REQUEST structure can be passed as the first parameter (lpv) to the ExtensionPropSheetPageProc entry point in the SetupAPI DLL.
 * @remarks
 * 
 * The component that is retrieving the property pages calls SetupAPI's <b>ExtensionPropSheetPageProc</b> function and passes in a pointer to a SP_PROPSHEETPAGE_REQUEST structure, the address of their  <b>AddPropSheetPageProc </b>function, and some private data. The property sheet provider calls the <b>AddPropSheetPageProc</b> routine for each property sheet it provides. 
 * 
 * The following code excerpt shows how to retrieve one page, the SetupAPI's Resource Selection page:
 * 
 * 
 * ```
 * {
 *     DWORD Err;
 *     HINSTANCE hLib;
 *     FARPROC PropSheetExtProc;
 *     HPROPSHEETPAGE hPages[2];
 *     .
 *     .
 *     .
 *         if(!(hLib = GetModuleHandle(TEXT("setupapi.dll")))) {
 *             return GetLastError();
 *         }
 * 
 *         if(!(PropSheetExtProc = GetProcAddress(hLib,
 *                  "ExtensionPropSheetPageProc"))) {
 *             Err = GetLastError();
 *             FreeLibrary(hLib);
 *             return Err;
 *         }
 * 
 *         PropPageRequest.cbSize = sizeof(SP_PROPSHEETPAGE_REQUEST);
 *         PropPageRequest.PageRequested  = 
 *             SPPSR_SELECT_DEVICE_RESOURCES;
 *         PropPageRequest.DeviceInfoSet  = DeviceInfoSet;
 *         PropPageRequest.DeviceInfoData = DeviceInfoData;
 * 
 *         if(!PropSheetExtProc(&PropPageRequest, 
 *                 AddPropSheetPageProc, &hPages[1])) {
 *             Err = ERROR_INVALID_PARAMETER;
 *             FreeLibrary(hLib);
 *             return Err;
 *         }
 *         .
 *         .
 *         .
 * }
 * ```
 * 
 * 
 * The <b>AddPropSheetPageProc</b> for the previous excerpt would be something like the following:
 * 
 * 
 * ```
 * BOOL
 * CALLBACK
 * AddPropSheetPageProc(
 *     IN HPROPSHEETPAGE hpage,
 *     IN LPARAM lParam
 *    )
 * {
 *     *((HPROPSHEETPAGE *)lParam) = hpage;
 *     return TRUE;
 * }
 * ```
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//setupapi/ns-setupapi-sp_propsheetpage_request
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 * @version v4.0.30319
 */
class SP_PROPSHEETPAGE_REQUEST extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * The size, in bytes, of the SP_PROPSHEETPAGE_REQUEST structure.
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * 
     * @type {Integer}
     */
    PageRequested {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The handle for the device information set that contains the device being installed.
     * @type {HDEVINFO}
     */
    DeviceInfoSet{
        get {
            if(!this.HasProp("__DeviceInfoSet"))
                this.__DeviceInfoSet := HDEVINFO(8, this)
            return this.__DeviceInfoSet
        }
    }

    /**
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/setupapi/ns-setupapi-sp_devinfo_data">SP_DEVINFO_DATA</a> structure for the device being installed.
     * @type {Pointer<SP_DEVINFO_DATA>}
     */
    DeviceInfoData {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    __New(ptrOrObj := 0, parent := ""){
        super.__New(ptrOrObj, parent)
        this.cbSize := 24
    }
}
