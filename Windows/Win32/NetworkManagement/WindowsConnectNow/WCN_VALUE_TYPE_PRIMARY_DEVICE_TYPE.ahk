#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * WCN_VALUE_TYPE_PRIMARY_DEVICE_TYPE structure contains information that identifies the device type by category, sub-category, and a manufacturer specific OUI (Organization ID).
 * @see https://learn.microsoft.com/windows/win32/api/wcntypes/ns-wcntypes-wcn_value_type_primary_device_type
 * @namespace Windows.Win32.NetworkManagement.WindowsConnectNow
 * @version v4.0.30319
 */
class WCN_VALUE_TYPE_PRIMARY_DEVICE_TYPE extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * Specifies the primary device type category. This data is supplied in network byte order.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WCN_VALUE_DT_CATEGORY_COMPUTER"></a><a id="wcn_value_dt_category_computer"></a><dl>
     * <dt><b>WCN_VALUE_DT_CATEGORY_COMPUTER</b></dt>
     * <dt>0x1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates a computer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WCN_VALUE_DT_CATEGORY_INPUT_DEVICE"></a><a id="wcn_value_dt_category_input_device"></a><dl>
     * <dt><b>WCN_VALUE_DT_CATEGORY_INPUT_DEVICE</b></dt>
     * <dt>0x2</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates an input device.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WCN_VALUE_DT_CATEGORY_PRINTER"></a><a id="wcn_value_dt_category_printer"></a><dl>
     * <dt><b>WCN_VALUE_DT_CATEGORY_PRINTER</b></dt>
     * <dt>0x3</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates a printer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WCN_VALUE_DT_CATEGORY_CAMERA"></a><a id="wcn_value_dt_category_camera"></a><dl>
     * <dt><b>WCN_VALUE_DT_CATEGORY_CAMERA</b></dt>
     * <dt>0x4</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates a camera.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WCN_VALUE_DT_CATEGORY_STORAGE"></a><a id="wcn_value_dt_category_storage"></a><dl>
     * <dt><b>WCN_VALUE_DT_CATEGORY_STORAGE</b></dt>
     * <dt>0x5</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates a storage device.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WCN_VALUE_DT_CATEGORY_NETWORK_INFRASTRUCTURE"></a><a id="wcn_value_dt_category_network_infrastructure"></a><dl>
     * <dt><b>WCN_VALUE_DT_CATEGORY_NETWORK_INFRASTRUCTURE</b></dt>
     * <dt>0x6</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates a network.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WCN_VALUE_DT_CATEGORY_DISPLAY"></a><a id="wcn_value_dt_category_display"></a><dl>
     * <dt><b>WCN_VALUE_DT_CATEGORY_DISPLAY</b></dt>
     * <dt>0x7</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates a display.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WCN_VALUE_DT_CATEGORY_MULTIMEDIA_DEVICE"></a><a id="wcn_value_dt_category_multimedia_device"></a><dl>
     * <dt><b>WCN_VALUE_DT_CATEGORY_MULTIMEDIA_DEVICE</b></dt>
     * <dt>0x8</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates a multimedia device.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WCN_VALUE_DT_CATEGORY_GAMING_DEVICE"></a><a id="wcn_value_dt_category_gaming_device"></a><dl>
     * <dt><b>WCN_VALUE_DT_CATEGORY_GAMING_DEVICE</b></dt>
     * <dt>0x9</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates a gaming device.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WCN_VALUE_DT_CATEGORY_TELEPHONE"></a><a id="wcn_value_dt_category_telephone"></a><dl>
     * <dt><b>WCN_VALUE_DT_CATEGORY_TELEPHONE</b></dt>
     * <dt>0xa</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates a telephone.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WCN_VALUE_DT_CATEGORY_AUDIO_DEVICE"></a><a id="wcn_value_dt_category_audio_device"></a><dl>
     * <dt><b>WCN_VALUE_DT_CATEGORY_AUDIO_DEVICE</b></dt>
     * <dt>0xb</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates an audio device.
     * 
     * <div class="alert"><b>Note</b>  Only available  in Windows 8.</div>
     * <div> </div>
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WCN_VALUE_DT_CATEGORY_OTHER"></a><a id="wcn_value_dt_category_other"></a><dl>
     * <dt><b>WCN_VALUE_DT_CATEGORY_OTHER</b></dt>
     * <dt>0xff</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates an unspecified device.
     * 
     * <div class="alert"><b>Note</b>  Only available  in Windows 8.</div>
     * <div> </div>
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    Category {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * Specifies the unique manufacturer OUI associated with the device.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WCN_VALUE_DT_SUBTYPE_WIFI_OUI"></a><a id="wcn_value_dt_subtype_wifi_oui"></a><dl>
     * <dt><b>WCN_VALUE_DT_SUBTYPE_WIFI_OUI</b></dt>
     * <dt>0x50f204</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates the specific manufacturer Organization ID (OUI)  for a wireless device.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    SubCategoryOUI {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Specifies the primary device type sub-category. This data is supplied in network byte order. If <b>SubCategoryOUI</b> is equal to <b>WCN_VALUE_DT_SUBTYPE_WIFI_OUI</b>, then any of the values below are valid. Otherwise, the SubCategory has been defined by the vendor.
     * 
     * 
     * The following values are possible when the <b>Category</b> member is set to <b>WCN_VALUE_DT_CATEGORY_COMPUTER</b>.
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WCN_VALUE_DT_SUBTYPE_COMPUTER_PC"></a><a id="wcn_value_dt_subtype_computer_pc"></a><dl>
     * <dt><b>WCN_VALUE_DT_SUBTYPE_COMPUTER_PC</b></dt>
     * <dt>0x1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates a personal computer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WCN_VALUE_DT_SUBTYPE_COMPUTER_SERVER"></a><a id="wcn_value_dt_subtype_computer_server"></a><dl>
     * <dt><b>WCN_VALUE_DT_SUBTYPE_COMPUTER_SERVER</b></dt>
     * <dt>0x2</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates a server.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WCN_VALUE_DT_SUBTYPE_COMPUTER_MEDIACENTER"></a><a id="wcn_value_dt_subtype_computer_mediacenter"></a><dl>
     * <dt><b>WCN_VALUE_DT_SUBTYPE_COMPUTER_MEDIACENTER</b></dt>
     * <dt>0x3</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates  a media center.
     * 
     * <div class="alert"><b>Note</b>  Only available  in Windows 8.</div>
     * <div> </div>
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WCN_VALUE_DT_SUBTYPE_COMPUTER_ULTRAMOBILEPC"></a><a id="wcn_value_dt_subtype_computer_ultramobilepc"></a><dl>
     * <dt><b>WCN_VALUE_DT_SUBTYPE_COMPUTER_ULTRAMOBILEPC</b></dt>
     * <dt>0x4</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates an Ultra-Mobile PC.
     * 
     * <div class="alert"><b>Note</b>  Only available  in Windows 8.</div>
     * <div> </div>
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WCN_VALUE_DT_SUBTYPE_COMPUTER_NOTEBOOK"></a><a id="wcn_value_dt_subtype_computer_notebook"></a><dl>
     * <dt><b>WCN_VALUE_DT_SUBTYPE_COMPUTER_NOTEBOOK</b></dt>
     * <dt>0x5</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates a notebook computer.
     * 
     * <div class="alert"><b>Note</b>  Only available  in Windows 8.</div>
     * <div> </div>
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WCN_VALUE_DT_SUBTYPE_COMPUTER_DESKTOP"></a><a id="wcn_value_dt_subtype_computer_desktop"></a><dl>
     * <dt><b>WCN_VALUE_DT_SUBTYPE_COMPUTER_DESKTOP</b></dt>
     * <dt>0x6</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates a desktop computer.
     * 
     * <div class="alert"><b>Note</b>  Only available  in Windows 8.</div>
     * <div> </div>
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WCN_VALUE_DT_SUBTYPE_COMPUTER_MID"></a><a id="wcn_value_dt_subtype_computer_mid"></a><dl>
     * <dt><b>WCN_VALUE_DT_SUBTYPE_COMPUTER_MID</b></dt>
     * <dt>0x7</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates a mobile Internet device.
     * 
     * <div class="alert"><b>Note</b>  Only available  in Windows 8.</div>
     * <div> </div>
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WCN_VALUE_DT_SUBTYPE_COMPUTER_NETBOOK"></a><a id="wcn_value_dt_subtype_computer_netbook"></a><dl>
     * <dt><b>WCN_VALUE_DT_SUBTYPE_COMPUTER_NETBOOK</b></dt>
     * <dt>0x8</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates a netbook.
     * 
     * <div class="alert"><b>Note</b>  Only available  in Windows 8.</div>
     * <div> </div>
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * The following values are possible when the <b>Category</b> member is set to <b>WCN_VALUE_DT_CATEGORY_INPUT_DEVICE</b>.
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WCN_VALUE_DT_SUBTYPE_INPUT_DEVICE_KEYBOARD"></a><a id="wcn_value_dt_subtype_input_device_keyboard"></a><dl>
     * <dt><b>WCN_VALUE_DT_SUBTYPE_INPUT_DEVICE_KEYBOARD</b></dt>
     * <dt>0x1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates a keyboard.
     * 
     * <div class="alert"><b>Note</b>  Only available  in Windows 8.</div>
     * <div> </div>
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WCN_VALUE_DT_SUBTYPE_INPUT_DEVICE_MOUSE"></a><a id="wcn_value_dt_subtype_input_device_mouse"></a><dl>
     * <dt><b>WCN_VALUE_DT_SUBTYPE_INPUT_DEVICE_MOUSE</b></dt>
     * <dt>0x2</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates a mouse.
     * 
     * <div class="alert"><b>Note</b>  Only available  in Windows 8.</div>
     * <div> </div>
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WCN_VALUE_DT_SUBTYPE_INPUT_DEVICE_JOYSTICK"></a><a id="wcn_value_dt_subtype_input_device_joystick"></a><dl>
     * <dt><b>WCN_VALUE_DT_SUBTYPE_INPUT_DEVICE_JOYSTICK</b></dt>
     * <dt>0x3</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates a joystick.
     * 
     * <div class="alert"><b>Note</b>  Only available  in Windows 8.</div>
     * <div> </div>
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WCN_VALUE_DT_SUBTYPE_INPUT_DEVICE_TRACKBALL"></a><a id="wcn_value_dt_subtype_input_device_trackball"></a><dl>
     * <dt><b>WCN_VALUE_DT_SUBTYPE_INPUT_DEVICE_TRACKBALL</b></dt>
     * <dt>0x4</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates a trackball.
     * 
     * <div class="alert"><b>Note</b>  Only available  in Windows 8.</div>
     * <div> </div>
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WCN_VALUE_DT_SUBTYPE_INPUT_DEVICE_GAMECONTROLLER"></a><a id="wcn_value_dt_subtype_input_device_gamecontroller"></a><dl>
     * <dt><b>WCN_VALUE_DT_SUBTYPE_INPUT_DEVICE_GAMECONTROLLER</b></dt>
     * <dt>0x5</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates a game controller.
     * 
     * <div class="alert"><b>Note</b>  Only available  in Windows 8.</div>
     * <div> </div>
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WCN_VALUE_DT_SUBTYPE_INPUT_DEVICE_REMOTE"></a><a id="wcn_value_dt_subtype_input_device_remote"></a><dl>
     * <dt><b>WCN_VALUE_DT_SUBTYPE_INPUT_DEVICE_REMOTE</b></dt>
     * <dt>0x6</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates a remote control.
     * 
     * <div class="alert"><b>Note</b>  Only available  in Windows 8.</div>
     * <div> </div>
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WCN_VALUE_DT_SUBTYPE_INPUT_DEVICE_TOUCHSCREEN"></a><a id="wcn_value_dt_subtype_input_device_touchscreen"></a><dl>
     * <dt><b>WCN_VALUE_DT_SUBTYPE_INPUT_DEVICE_TOUCHSCREEN</b></dt>
     * <dt>0x7</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates a touch screen.
     * 
     * <div class="alert"><b>Note</b>  Only available  in Windows 8.</div>
     * <div> </div>
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WCN_VALUE_DT_SUBTYPE_INPUT_DEVICE_BIOMETRICREADER"></a><a id="wcn_value_dt_subtype_input_device_biometricreader"></a><dl>
     * <dt><b>WCN_VALUE_DT_SUBTYPE_INPUT_DEVICE_BIOMETRICREADER</b></dt>
     * <dt>0x8</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates a biometric reader.
     * 
     * <div class="alert"><b>Note</b>  Only available  in Windows 8.</div>
     * <div> </div>
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WCN_VALUE_DT_SUBTYPE_INPUT_DEVICE_BARCODEREADER"></a><a id="wcn_value_dt_subtype_input_device_barcodereader"></a><dl>
     * <dt><b>WCN_VALUE_DT_SUBTYPE_INPUT_DEVICE_BARCODEREADER</b></dt>
     * <dt>0x9</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates a barcode reader.
     * 
     * <div class="alert"><b>Note</b>  Only available  in Windows 8.</div>
     * <div> </div>
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * The following values are possible when the <b>Category</b> member is set to <b>WCN_VALUE_DT_CATEGORY_PRINTER</b>.
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WCN_VALUE_DT_SUBTYPE_PRINTER_PRINTER"></a><a id="wcn_value_dt_subtype_printer_printer"></a><dl>
     * <dt><b>WCN_VALUE_DT_SUBTYPE_PRINTER_PRINTER</b></dt>
     * <dt>0x1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates a printer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WCN_VALUE_DT_SUBTYPE_PRINTER_SCANNER"></a><a id="wcn_value_dt_subtype_printer_scanner"></a><dl>
     * <dt><b>WCN_VALUE_DT_SUBTYPE_PRINTER_SCANNER</b></dt>
     * <dt>0x2</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates a scanner.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WCN_VALUE_DT_SUBTYPE_PRINTER_FAX"></a><a id="wcn_value_dt_subtype_printer_fax"></a><dl>
     * <dt><b>WCN_VALUE_DT_SUBTYPE_PRINTER_FAX</b></dt>
     * <dt>0x3</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates a fax machine.
     * 
     * <div class="alert"><b>Note</b>  Only available  in Windows 8.</div>
     * <div> </div>
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WCN_VALUE_DT_SUBTYPE_PRINTER_COPIER"></a><a id="wcn_value_dt_subtype_printer_copier"></a><dl>
     * <dt><b>WCN_VALUE_DT_SUBTYPE_PRINTER_COPIER</b></dt>
     * <dt>0x4</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates a copier.
     * 
     * <div class="alert"><b>Note</b>  Only available  in Windows 8.</div>
     * <div> </div>
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WCN_VALUE_DT_SUBTYPE_PRINTER_ALLINONE"></a><a id="wcn_value_dt_subtype_printer_allinone"></a><dl>
     * <dt><b>WCN_VALUE_DT_SUBTYPE_PRINTER_ALLINONE</b></dt>
     * <dt>0x4</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates an all-in-one printer.
     * 
     * <div class="alert"><b>Note</b>  Only available  in Windows 8.</div>
     * <div> </div>
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * The following values are possible when the <b>Category</b> member is set to <b>WCN_VALUE_DT_CATEGORY_CAMERA</b>.
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WCN_VALUE_DT_SUBTYPE_CAMERA_STILL_CAMERA"></a><a id="wcn_value_dt_subtype_camera_still_camera"></a><dl>
     * <dt><b>WCN_VALUE_DT_SUBTYPE_CAMERA_STILL_CAMERA</b></dt>
     * <dt>0x1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates a still-shot camera.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WCN_VALUE_DT_SUBTYPE_CAMERA_VIDEO_CAMERA"></a><a id="wcn_value_dt_subtype_camera_video_camera"></a><dl>
     * <dt><b>WCN_VALUE_DT_SUBTYPE_CAMERA_VIDEO_CAMERA</b></dt>
     * <dt>0x2</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates a video camera.
     * 
     * <div class="alert"><b>Note</b>  Only available  in Windows 8.</div>
     * <div> </div>
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WCN_VALUE_DT_SUBTYPE_CAMERA_WEB_CAMERA"></a><a id="wcn_value_dt_subtype_camera_web_camera"></a><dl>
     * <dt><b>WCN_VALUE_DT_SUBTYPE_CAMERA_WEB_CAMERA</b></dt>
     * <dt>0x3</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates a web camera.
     * 
     * <div class="alert"><b>Note</b>  Only available  in Windows 8.</div>
     * <div> </div>
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WCN_VALUE_DT_SUBTYPE_CAMERA_SECURITY_CAMERA"></a><a id="wcn_value_dt_subtype_camera_security_camera"></a><dl>
     * <dt><b>WCN_VALUE_DT_SUBTYPE_CAMERA_SECURITY_CAMERA</b></dt>
     * <dt>0x4</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates a security camera.
     * 
     * <div class="alert"><b>Note</b>  Only available  in Windows 8.</div>
     * <div> </div>
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * The following values are possible when the <b>Category</b> member is set to <b>WCN_VALUE_DT_CATEGORY_NETWORK_STORAGE</b>.
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WCN_VALUE_DT_SUBTYPE_STORAGE_NAS"></a><a id="wcn_value_dt_subtype_storage_nas"></a><dl>
     * <dt><b>WCN_VALUE_DT_SUBTYPE_STORAGE_NAS</b></dt>
     * <dt>0x1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates a network storage device.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * The following values are possible when the <b>Category</b> member is set to <b>WCN_VALUE_DT_CATEGORY_NETWORK_INFRASTRUCTURE</b>.
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WCN_VALUE_DT_SUBTYPE_NETWORK_INFRASTRUCUTURE_AP"></a><a id="wcn_value_dt_subtype_network_infrastrucuture_ap"></a><dl>
     * <dt><b>WCN_VALUE_DT_SUBTYPE_NETWORK_INFRASTRUCUTURE_AP</b></dt>
     * <dt>0x1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates an access point.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WCN_VALUE_DT_SUBTYPE_NETWORK_INFRASTRUCUTURE_ROUTER"></a><a id="wcn_value_dt_subtype_network_infrastrucuture_router"></a><dl>
     * <dt><b>WCN_VALUE_DT_SUBTYPE_NETWORK_INFRASTRUCUTURE_ROUTER</b></dt>
     * <dt>0x2</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates a router.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WCN_VALUE_DT_SUBTYPE_NETWORK_INFRASTRUCUTURE_SWITCH"></a><a id="wcn_value_dt_subtype_network_infrastrucuture_switch"></a><dl>
     * <dt><b>WCN_VALUE_DT_SUBTYPE_NETWORK_INFRASTRUCUTURE_SWITCH</b></dt>
     * <dt>0x3</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates a switch.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WCN_VALUE_DT_SUBTYPE_NETWORK_INFRASTRUCUTURE_GATEWAY"></a><a id="wcn_value_dt_subtype_network_infrastrucuture_gateway"></a><dl>
     * <dt><b>WCN_VALUE_DT_SUBTYPE_NETWORK_INFRASTRUCUTURE_GATEWAY</b></dt>
     * <dt>0x4</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates a gateway.
     * 
     * <div class="alert"><b>Note</b>  Only available  in Windows 8.</div>
     * <div> </div>
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WCN_VALUE_DT_SUBTYPE_NETWORK_INFRASTRUCUTURE_BRIDGE"></a><a id="wcn_value_dt_subtype_network_infrastrucuture_bridge"></a><dl>
     * <dt><b>WCN_VALUE_DT_SUBTYPE_NETWORK_INFRASTRUCUTURE_BRIDGE</b></dt>
     * <dt>0x5</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates a bridge.
     * 
     * <div class="alert"><b>Note</b>  Only available  in Windows 8.</div>
     * <div> </div>
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * The following values are possible when the <b>Category</b> member is set to <b>WCN_VALUE_DT_CATEGORY_DISPLAY</b>.
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WCN_VALUE_DT_SUBTYPE_DISPLAY_TELEVISION"></a><a id="wcn_value_dt_subtype_display_television"></a><dl>
     * <dt><b>WCN_VALUE_DT_SUBTYPE_DISPLAY_TELEVISION</b></dt>
     * <dt>0x1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates a television.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WCN_VALUE_DT_SUBTYPE_DISPLAY_PICTURE_FRAME"></a><a id="wcn_value_dt_subtype_display_picture_frame"></a><dl>
     * <dt><b>WCN_VALUE_DT_SUBTYPE_DISPLAY_PICTURE_FRAME</b></dt>
     * <dt>0x2</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates an electronic picture frame.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WCN_VALUE_DT_SUBTYPE_DISPLAY_PROJECTOR"></a><a id="wcn_value_dt_subtype_display_projector"></a><dl>
     * <dt><b>WCN_VALUE_DT_SUBTYPE_DISPLAY_PROJECTOR</b></dt>
     * <dt>0x3</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates a digital projector.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WCN_VALUE_DT_SUBTYPE_DISPLAY_MONITOR"></a><a id="wcn_value_dt_subtype_display_monitor"></a><dl>
     * <dt><b>WCN_VALUE_DT_SUBTYPE_DISPLAY_MONITOR</b></dt>
     * <dt>0x4</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates a monitor.
     * 
     * <div class="alert"><b>Note</b>  Only available  in Windows 8.</div>
     * <div> </div>
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * The following values are possible when the <b>Category</b> member is set to <b>WCN_VALUE_DT_CATEGORY_MULTIMEDIA_DEVICE</b>.
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WCN_VALUE_DT_SUBTYPE_MULTIMEDIA_DEVICE_DAR"></a><a id="wcn_value_dt_subtype_multimedia_device_dar"></a><dl>
     * <dt><b>WCN_VALUE_DT_SUBTYPE_MULTIMEDIA_DEVICE_DAR</b></dt>
     * <dt>0x1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates a digital audio recorder.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WCN_VALUE_DT_SUBTYPE_MULTIMEDIA_DEVICE_PVR"></a><a id="wcn_value_dt_subtype_multimedia_device_pvr"></a><dl>
     * <dt><b>WCN_VALUE_DT_SUBTYPE_MULTIMEDIA_DEVICE_PVR</b></dt>
     * <dt>0x2</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates a personal video recorder.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WCN_VALUE_DT_SUBTYPE_MULTIMEDIA_DEVICE_MCX"></a><a id="wcn_value_dt_subtype_multimedia_device_mcx"></a><dl>
     * <dt><b>WCN_VALUE_DT_SUBTYPE_MULTIMEDIA_DEVICE_MCX</b></dt>
     * <dt>0x3</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates a Yamaha Digital Multimedia Receiver.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WCN_VALUE_DT_SUBTYPE_MULTIMEDIA_DEVICE_SETTOPBOX"></a><a id="wcn_value_dt_subtype_multimedia_device_settopbox"></a><dl>
     * <dt><b>WCN_VALUE_DT_SUBTYPE_MULTIMEDIA_DEVICE_SETTOPBOX</b></dt>
     * <dt>0x4</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates a set-top box.
     * 
     * <div class="alert"><b>Note</b>  Only available  in Windows 8.</div>
     * <div> </div>
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WCN_VALUE_DT_SUBTYPE_MULTIMEDIA_DEVICE_MEDIA_SERVER_ADAPT_EXT"></a><a id="wcn_value_dt_subtype_multimedia_device_media_server_adapt_ext"></a><dl>
     * <dt><b>WCN_VALUE_DT_SUBTYPE_MULTIMEDIA_DEVICE_MEDIA_SERVER_ADAPT_EXT</b></dt>
     * <dt>0x5</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates a media server, media adapter, or media extender.
     * 
     * <div class="alert"><b>Note</b>  Only available  in Windows 8.</div>
     * <div> </div>
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WCN_VALUE_DT_SUBTYPE_MULTIMEDIA_DEVICE_PVP"></a><a id="wcn_value_dt_subtype_multimedia_device_pvp"></a><dl>
     * <dt><b>WCN_VALUE_DT_SUBTYPE_MULTIMEDIA_DEVICE_PVP</b></dt>
     * <dt>0x6</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates  a portable video player.
     * 
     * <div class="alert"><b>Note</b>  Only available  in Windows 8.</div>
     * <div> </div>
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * The following values are possible when the <b>Category</b> member is set to <b>WCN_VALUE_DT_CATEGORY_GAMING_DEVICE</b>.
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WCN_VALUE_DT_SUBTYPE_GAMING_DEVICE_XBOX"></a><a id="wcn_value_dt_subtype_gaming_device_xbox"></a><dl>
     * <dt><b>WCN_VALUE_DT_SUBTYPE_GAMING_DEVICE_XBOX</b></dt>
     * <dt>0x1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates a Microsoft XBOX console.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WCN_VALUE_DT_SUBTYPE_GAMING_DEVICE_XBOX360"></a><a id="wcn_value_dt_subtype_gaming_device_xbox360"></a><dl>
     * <dt><b>WCN_VALUE_DT_SUBTYPE_GAMING_DEVICE_XBOX360</b></dt>
     * <dt>0x2</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates a Microsoft XBOX 360 console.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WCN_VALUE_DT_SUBTYPE_GAMING_DEVICE_PLAYSTATION"></a><a id="wcn_value_dt_subtype_gaming_device_playstation"></a><dl>
     * <dt><b>WCN_VALUE_DT_SUBTYPE_GAMING_DEVICE_PLAYSTATION</b></dt>
     * <dt>0x3</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates a Sony Playstation 3.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WCN_VALUE_DT_SUBTYPE_GAMING_DEVICE_CONSOLE_ADAPT"></a><a id="wcn_value_dt_subtype_gaming_device_console_adapt"></a><dl>
     * <dt><b>WCN_VALUE_DT_SUBTYPE_GAMING_DEVICE_CONSOLE_ADAPT</b></dt>
     * <dt>0x4</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates a game console adapter.
     * 
     * <div class="alert"><b>Note</b>  Only available  in Windows 8.</div>
     * <div> </div>
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WCN_VALUE_DT_SUBTYPE_GAMING_DEVICE_PORTABLE"></a><a id="wcn_value_dt_subtype_gaming_device_portable"></a><dl>
     * <dt><b>WCN_VALUE_DT_SUBTYPE_GAMING_DEVICE_PORTABLE</b></dt>
     * <dt>0x5</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates  a portable gaming device.
     * 
     * <div class="alert"><b>Note</b>  Only available  in Windows 8.</div>
     * <div> </div>
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * The following values are possible when the <b>Category</b> member is set to <b>WCN_VALUE_DT_CATEGORY_TELEPHONE</b>.
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WCN_VALUE_DT_SUBTYPE_TELEPHONE_WINDOWS_MOBILE"></a><a id="wcn_value_dt_subtype_telephone_windows_mobile"></a><dl>
     * <dt><b>WCN_VALUE_DT_SUBTYPE_TELEPHONE_WINDOWS_MOBILE</b></dt>
     * <dt>0x1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates a Windows Mobile device.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WCN_VALUE_DT_SUBTYPE_TELEPHONE_PHONE_SINGLEMODE"></a><a id="wcn_value_dt_subtype_telephone_phone_singlemode"></a><dl>
     * <dt><b>WCN_VALUE_DT_SUBTYPE_TELEPHONE_PHONE_SINGLEMODE</b></dt>
     * <dt>0x2</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates  a single-mode phone.
     * 
     * <div class="alert"><b>Note</b>  Only available  in Windows 8.</div>
     * <div> </div>
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WCN_VALUE_DT_SUBTYPE_TELEPHONE_PHONE_DUALMODE"></a><a id="wcn_value_dt_subtype_telephone_phone_dualmode"></a><dl>
     * <dt><b>WCN_VALUE_DT_SUBTYPE_TELEPHONE_PHONE_DUALMODE</b></dt>
     * <dt>0x3</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates a dual-mode phone.
     * 
     * <div class="alert"><b>Note</b>  Only available  in Windows 8.</div>
     * <div> </div>
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WCN_VALUE_DT_SUBTYPE_TELEPHONE_PHONE_SMARTPHONE_SINGLEMODE"></a><a id="wcn_value_dt_subtype_telephone_phone_smartphone_singlemode"></a><dl>
     * <dt><b>WCN_VALUE_DT_SUBTYPE_TELEPHONE_PHONE_SMARTPHONE_SINGLEMODE</b></dt>
     * <dt>0x4</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates  a single-mode smartphone.
     * 
     * <div class="alert"><b>Note</b>  Only available  in Windows 8.</div>
     * <div> </div>
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WCN_VALUE_DT_SUBTYPE_TELEPHONE_PHONE_SMARTPHONE_DUALMODE"></a><a id="wcn_value_dt_subtype_telephone_phone_smartphone_dualmode"></a><dl>
     * <dt><b>WCN_VALUE_DT_SUBTYPE_TELEPHONE_PHONE_SMARTPHONE_DUALMODE</b></dt>
     * <dt>0x2</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates a dual-mode smartphone.
     * 
     * <div class="alert"><b>Note</b>  Only available  in Windows 8.</div>
     * <div> </div>
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * The following values are possible when the <b>Category</b> member is set to <b>WCN_VALUE_DT_CATEGORY_AUDIO_DEVICE</b>.
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WCN_VALUE_DT_SUBTYPE_AUDIO_DEVICE_TUNER_RECEIVER"></a><a id="wcn_value_dt_subtype_audio_device_tuner_receiver"></a><dl>
     * <dt><b>WCN_VALUE_DT_SUBTYPE_AUDIO_DEVICE_TUNER_RECEIVER</b></dt>
     * <dt>0x1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates an audio tuner/receiver.
     * 
     * <div class="alert"><b>Note</b>  Only available  in Windows 8.</div>
     * <div> </div>
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WCN_VALUE_DT_SUBTYPE_AUDIO_DEVICE_SPEAKERS"></a><a id="wcn_value_dt_subtype_audio_device_speakers"></a><dl>
     * <dt><b>WCN_VALUE_DT_SUBTYPE_AUDIO_DEVICE_SPEAKERS</b></dt>
     * <dt>0x2</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates speakers.
     * 
     * <div class="alert"><b>Note</b>  Only available  in Windows 8.</div>
     * <div> </div>
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WCN_VALUE_DT_SUBTYPE_AUDIO_DEVICE_PMP"></a><a id="wcn_value_dt_subtype_audio_device_pmp"></a><dl>
     * <dt><b>WCN_VALUE_DT_SUBTYPE_AUDIO_DEVICE_PMP</b></dt>
     * <dt>0x2</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates a personal media player.
     * 
     * <div class="alert"><b>Note</b>  Only available  in Windows 8.</div>
     * <div> </div>
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WCN_VALUE_DT_SUBTYPE_AUDIO_DEVICE_HEADSET"></a><a id="wcn_value_dt_subtype_audio_device_headset"></a><dl>
     * <dt><b>WCN_VALUE_DT_SUBTYPE_AUDIO_DEVICE_HEADSET</b></dt>
     * <dt>0x2</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates a headset.
     * 
     * <div class="alert"><b>Note</b>  Only available  in Windows 8.</div>
     * <div> </div>
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WCN_VALUE_DT_SUBTYPE_AUDIO_DEVICE_HEADPHONES"></a><a id="wcn_value_dt_subtype_audio_device_headphones"></a><dl>
     * <dt><b>WCN_VALUE_DT_SUBTYPE_AUDIO_DEVICE_HEADPHONES</b></dt>
     * <dt>0x2</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates headphones.
     * 
     * <div class="alert"><b>Note</b>  Only available  in Windows 8.</div>
     * <div> </div>
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WCN_VALUE_DT_SUBTYPE_AUDIO_DEVICE_MICROPHONE"></a><a id="wcn_value_dt_subtype_audio_device_microphone"></a><dl>
     * <dt><b>WCN_VALUE_DT_SUBTYPE_AUDIO_DEVICE_MICROPHONE</b></dt>
     * <dt>0x2</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates a microphone.
     * 
     * <div class="alert"><b>Note</b>  Only available  in Windows 8.</div>
     * <div> </div>
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WCN_VALUE_DT_SUBTYPE_AUDIO_DEVICE_HOMETHEATER"></a><a id="wcn_value_dt_subtype_audio_device_hometheater"></a><dl>
     * <dt><b>WCN_VALUE_DT_SUBTYPE_AUDIO_DEVICE_HOMETHEATER</b></dt>
     * <dt>0x2</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates a home theater system.
     * 
     * <div class="alert"><b>Note</b>  Only available  in Windows 8.</div>
     * <div> </div>
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    SubCategory {
        get => NumGet(this, 8, "ushort")
        set => NumPut("ushort", value, this, 8)
    }
}
