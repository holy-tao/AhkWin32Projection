#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IEnumWIA_DEV_INFO.ahk
#Include .\IWiaItem2.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IWiaDevMgr2 interface is used to create and manage image acquisition devices and to register to receive device events.
 * @remarks
 * The **IWiaDevMgr2** interface inherits from the [**IUnknown**](/windows/win32/api/unknwn/nn-unknwn-iunknown) interface. **IWiaDevMgr2** also has these types of members:
 * 
 * -   [Methods](#methods)
 * 
 * 
 * The **IWiaDevMgr2** interface, like all Component Object Model (COM) interfaces, inherits the [IUnknown](/windows/win32/api/unknwn/nn-unknwn-iunknown) interface methods.
 * 
 * 
 * 
 * | IUnknown Methods                                        | Description                               |
 * |---------------------------------------------------------|-------------------------------------------|
 * | [IUnknown::QueryInterface](/windows/win32/api/unknwn/nf-unknwn-iunknown-queryinterface(q)) | Returns pointers to supported interfaces. |
 * | [IUnknown::AddRef](/windows/win32/api/unknwn/nf-unknwn-iunknown-addref)                 | Increments reference count.               |
 * | [IUnknown::Release](/windows/win32/api/unknwn/nf-unknwn-iunknown-release)               | Decrements reference count.               |
 * @see https://learn.microsoft.com/windows/win32/ktop-src/wia/-wia-iwiadevmgr2
 * @namespace Windows.Win32.Devices.ImageAcquisition
 * @version v4.0.30319
 */
class IWiaDevMgr2 extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWiaDevMgr2
     * @type {Guid}
     */
    static IID => Guid("{79c07cf1-cbdd-41ee-8ec3-f00080cada7a}")

    /**
     * The class identifier for WiaDevMgr2
     * @type {Guid}
     */
    static CLSID => Guid("{b6c292bc-7c88-41ee-8b54-8ec92617e599}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["EnumDeviceInfo", "CreateDevice", "SelectDeviceDlg", "SelectDeviceDlgID", "RegisterEventCallbackInterface", "RegisterEventCallbackProgram", "RegisterEventCallbackCLSID", "GetImageDlg"]

    /**
     * Creates an enumerator of property information for each available Windows Image Acquisition (WIA) 2.0 device.
     * @remarks
     * The **IWiaDevMgr2::EnumDeviceInfo** method creates an enumerator object that supports the [**IEnumWIA\_DEV\_INFO**](/windows/desktop/api/wia_xp/nn-wia_xp-ienumwia_dev_info) interface. The method stores a pointer to the **IEnumWIA\_DEV\_INFO** interface in the parameter *ppIEnum*. Applications can use the **IEnumWIA\_DEV\_INFO** interface pointer to enumerate the properties of each WIA 2.0 device attached to the user's computer.
     * 
     * Applications must call the [IUnknown::Release](/windows/win32/api/unknwn/nf-unknwn-iunknown-release) method on the interface pointers they receive through the *ppIEnum* parameter.
     * @param {Integer} lFlags Type: **LONG**
     * 
     * Specifies the type of WIA 2.0 devices to enumerate.
     * 
     * 
     * <span id="WIA_DEVINFO_ENUM_LOCAL"></span><span id="wia_devinfo_enum_local"></span>
     * 
     * <span id="WIA_DEVINFO_ENUM_LOCAL"></span><span id="wia_devinfo_enum_local"></span>**WIA\_DEVINFO\_ENUM\_LOCAL**
     * 
     * 
     * 
     * Only locally connected active scanner devices are enumerated.
     * 
     * 
     * <span id="WIA_DEVINFO_ENUM_ALL"></span><span id="wia_devinfo_enum_all"></span>
     * 
     * <span id="WIA_DEVINFO_ENUM_ALL"></span><span id="wia_devinfo_enum_all"></span>**WIA\_DEVINFO\_ENUM\_ALL**
     * 
     * 
     * 
     * All devices are enumerated, both locally and remote, including inactive (disconnected) devices and legacy STI-only devices.
     * @returns {IEnumWIA_DEV_INFO} Type: **[**IEnumWIA\_DEV\_INFO**](/windows/desktop/api/wia_xp/nn-wia_xp-ienumwia_dev_info)\*\***
     * 
     * Receives the address of a pointer to the [**IEnumWIA\_DEV\_INFO**](/windows/desktop/api/wia_xp/nn-wia_xp-ienumwia_dev_info) interface.
     * @see https://learn.microsoft.com/windows/win32/ktop-src/wia/-wia-iwiadevmgr2-enumdeviceinfo
     */
    EnumDeviceInfo(lFlags) {
        result := ComCall(3, this, "int", lFlags, "ptr*", &ppIEnum := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IEnumWIA_DEV_INFO(ppIEnum)
    }

    /**
     * Creates a hierarchical tree of IWiaItem2 objects for a Windows Image Acquisition (WIA) 2.0 device.
     * @remarks
     * Applications use the **IWiaDevMgr2::CreateDevice** method to create a device object for the WIA 2.0 devices specified by the bstrDeviceID parameter. When it returns, the **IWiaDevMgr2::CreateDevice** method stores an address of a pointer in the parameter *ppWiaItem2Root*, which points to the root item of the tree of [**IWiaItem2**](-wia-iwiaitem2.md) objects created by **IWiaDevMgr2::CreateDevice**. Applications can use this tree of objects to control and retrieve data from the WIA 2.0 device.
     * 
     * Applications must call the [IUnknown::Release](/windows/win32/api/unknwn/nf-unknwn-iunknown-release) method on the pointers they receive through the *ppWiaItem2Root* parameter.
     * @param {Integer} lFlags Type: **LONG**
     * 
     * Currently unused. Should be set to zero.
     * @param {BSTR} bstrDeviceID Type: **BSTR**
     * 
     * Specifies the unique identifier of the WIA 2.0 device.
     * @returns {IWiaItem2} Type: **[**IWiaItem2**](-wia-iwiaitem2.md)\*\***
     * 
     * Receives the address of a pointer to the [**IWiaItem2**](-wia-iwiaitem2.md) interface of the root item in the hierarchical tree for the WIA 2.0 device.
     * @see https://learn.microsoft.com/windows/win32/ktop-src/wia/-wia-iwiadevmgr2-createdevice
     */
    CreateDevice(lFlags, bstrDeviceID) {
        if(bstrDeviceID is String) {
            pin := BSTR.Alloc(bstrDeviceID)
            bstrDeviceID := pin.Value
        }

        result := ComCall(4, this, "int", lFlags, "ptr", bstrDeviceID, "ptr*", &ppWiaItem2Root := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IWiaItem2(ppWiaItem2Root)
    }

    /**
     * IWiaDevMgr2::SelectDeviceDlg method - Displays a dialog box that enables the user to select a hardware device for image acquisition.
     * @remarks
     * This method creates and displays the **Select Device** dialog box so the user can select a WIA 2.0 device for image acquisition. If a device is successfully selected, the **IWiaDevMgr2::SelectDeviceDlg** method creates a hierarchical tree of [**IWiaItem2**](-wia-iwiaitem2.md) objects for the device. It stores a pointer to the **IWiaItem2** interface of the root item in the parameter *ppItemRoot*.
     * 
     * The application can restrict the devices displayed to the user to particular types by specifying the device types through the *lDeviceType* parameter. If only one device meets the specification, **IWiaDevMgr2::SelectDeviceDlg** does not display the **Select Device** dialog box. Instead it creates the [**IWiaItem2**](-wia-iwiaitem2.md) tree for the device and store a pointer to the **IWiaItem2** interface of the root item in the parameter *ppItemRoot*. You can override this behavior and force **IWiaDevMgr2::SelectDeviceDlg** to display the dialog box by specifying WIA\_SELECT\_DEVICE\_NODEFAULT as the value for the *lFlags* parameter. If more than one WIA 2.0 device matches the specification, all matching devices are displayed in the **Select Device** dialog box so the user may choose one.
     * 
     * Applications must call the [IUnknown::Release](/windows/win32/api/unknwn/nf-unknwn-iunknown-release) method on the interface pointers they receive through the *ppItemRoot* parameter.
     * 
     * > [!Note]  
     * > It is recommended that applications make device and image selection available through a menu item named **From scanner** on the **File** menu.
     * @param {HWND} hwndParent Type: **HWND**
     * 
     * Specifies the parent window of the **Select Device** dialog box.
     * @param {Integer} lDeviceType Type: **LONG**
     * 
     * Specifies which type of WIA 2.0 device to use. See [WIA Device Type Specifiers](-wia-wia-device-type-specifiers.md) for a list of possible values.
     * @param {Integer} lFlags Type: **LONG**
     * 
     * Specifies the behavior of the dialog box. The value can be one of the following.
     * 
     * 
     * <span id="0"></span>
     * 
     * <span id="0"></span>**0**
     * 
     * 
     * 
     * Use the default behavior.
     * 
     * 
     * <span id="WIA_SELECT_DEVICE_NODEFAULT"></span><span id="wia_select_device_nodefault"></span>
     * 
     * <span id="WIA_SELECT_DEVICE_NODEFAULT"></span><span id="wia_select_device_nodefault"></span>**WIA\_SELECT\_DEVICE\_NODEFAULT**
     * 
     * 
     * 
     * Display the dialog box even though there is only one matching device.
     * @param {Pointer<BSTR>} pbstrDeviceID Type: **BSTR\***
     * 
     * On output, receives a string which contains the device's identifier string. On input, pass the address of a pointer if this information is needed, or **NULL** if it is not needed.
     * @returns {IWiaItem2} Type: **[**IWiaItem2**](-wia-iwiaitem2.md)\*\***
     * 
     * Receives the address of a pointer to the [**IWiaItem2**](-wia-iwiaitem2.md) interface of the root item of the hierarchical tree that represents the selected WIA 2.0 device. If no device is found, it receives **NULL**.
     * @see https://learn.microsoft.com/windows/win32/ktop-src/wia/-wia-iwiadevmgr2-selectdevicedlg
     */
    SelectDeviceDlg(hwndParent, lDeviceType, lFlags, pbstrDeviceID) {
        hwndParent := hwndParent is Win32Handle ? NumGet(hwndParent, "ptr") : hwndParent

        result := ComCall(5, this, "ptr", hwndParent, "int", lDeviceType, "int", lFlags, "ptr", pbstrDeviceID, "ptr*", &ppItemRoot := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IWiaItem2(ppItemRoot)
    }

    /**
     * IWiaDevMgr2::SelectDeviceDlgID method - Displays a dialog box that enables the user to select a hardware device for image acquisition.
     * @remarks
     * This method creates and displays the **Select Device** dialog box so the user can select a WIA 2.0 device for image acquisition. If a device is successfully selected, the **IWiaDevMgr2::SelectDeviceDlgID** method passes its identifier string to the application through its *pbstrDeviceID* parameter.
     * 
     * The application can restrict the devices displayed to the user to particular types by specifying the device types through the *lDeviceType* parameter. If only one device meets the specification, **IWiaDevMgr2::SelectDeviceDlgID** does not display the **Select Device** dialog box. Instead it passes the device's identifier string to the application without displaying the dialog box. You can override this behavior and force **IWiaDevMgr2::SelectDeviceDlgID** to display the dialog box by passing WIA\_SELECT\_DEVICE\_NODEFAULT as the value for the *lFlags* parameter. If more than one WIA 2.0 device matches the specification, all matching devices are displayed in the SelectDevice dialog box so the user may choose one.
     * 
     * > [!Note]  
     * > It is recommended that applications make device and image selection available through a menu item named **From scanner** on the **File** menu.
     * @param {HWND} hwndParent Type: **HWND**
     * 
     * Specifies the parent window of the **Select Device** dialog box.
     * @param {Integer} lDeviceType Type: **LONG**
     * 
     * Specifies which type of WIA 2.0 device to use. See [WIA Device Type Specifiers](-wia-wia-device-type-specifiers.md) for a list of possible values.
     * @param {Integer} lFlags Type: **LONG**
     * 
     * Specifies the behavior of the dialog box. The value can be one of the following.
     * 
     * 
     * <span id="0"></span>
     * 
     * <span id="0"></span>**0**
     * 
     * 
     * 
     * Use the default behavior.
     * 
     * 
     * <span id="WIA_SELECT_DEVICE_NODEFAULT"></span><span id="wia_select_device_nodefault"></span>
     * 
     * <span id="WIA_SELECT_DEVICE_NODEFAULT"></span><span id="wia_select_device_nodefault"></span>**WIA\_SELECT\_DEVICE\_NODEFAULT**
     * 
     * 
     * 
     * Display the dialog box even though there is only one matching device.
     * @param {Pointer<BSTR>} pbstrDeviceID Type: **BSTR\***
     * 
     * Pointer to a string that receives the identifier string of the device.
     * @returns {HRESULT} Type: **HRESULT**
     * 
     * This method can return one of these values.
     * 
     * 
     * 
     * | Return code                                                                                                  | Description                                                                                            |
     * |--------------------------------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------------------------|
     * | <dl> <dt>**S\_OK**</dt> </dl>                         | Device was successfully selected. <br/>                                                          |
     * | <dl> <dt>**S\_FALSE**</dt> </dl>                      | User canceled the dialog box. <br/>                                                              |
     * | <dl> <dt>**WIA\_S\_NO\_DEVICE\_AVAILABLE**</dt> </dl> | No WIA 2.0 hardware devices match the specifications given in the *lDeviceType* parameter. <br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/wia/-wia-iwiadevmgr2-selectdevicedlgid
     */
    SelectDeviceDlgID(hwndParent, lDeviceType, lFlags, pbstrDeviceID) {
        hwndParent := hwndParent is Win32Handle ? NumGet(hwndParent, "ptr") : hwndParent

        result := ComCall(6, this, "ptr", hwndParent, "int", lDeviceType, "int", lFlags, "ptr", pbstrDeviceID, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Registers a running application for Windows Image Acquisition (WIA) 2.0 event notification.
     * @remarks
     * > [!WARNING]
     * > Using the [**IWiaDevMgr::RegisterEventCallbackInterface**](/windows/desktop/api/wia_xp/nf-wia_xp-iwiadevmgr-registereventcallbackinterface), **IWiaDevMgr2::RegisterEventCallbackInterface**, and [**DeviceManager.RegisterEvent**](/previous-versions/windows/desktop/wiaaut/-wiaaut-idevicemanager-registerevent) methods from the same process after the Still Image Service is restarted may cause an access violation, if the functions were used before the service was stopped.
     * 
     *  
     * 
     * When WIA 2.0 applications begin executing, they use this method to register to receive hardware device events. This prevents the application from being restarted when another event for which it is registered occurs. Once an application calls **IWiaDevMgr2::RegisterEventCallbackInterface** to register itself to receive WIA 2.0 events from a device, the registered events are routed to the program by WIA 2.0.
     * 
     * Applications must call the [IUnknown::Release](/windows/win32/api/unknwn/nf-unknwn-iunknown-release) method on the interface pointers they receive through the *pEventObject* parameter.
     * 
     * > [!Note]  
     * > In a multithreaded application, the event notification callback may come in on a different thread from the one that registered the callback.
     * @param {Integer} lFlags Type: **LONG**
     * 
     * Currently unused. Should be set to zero.
     * @param {BSTR} bstrDeviceID Type: **BSTR**
     * 
     * Specifies the unique identifier of a WIA 2.0 device. Set this parameter to **NULL** to register for the event on all WIA 2.0 devices.
     * @param {Pointer<Guid>} pEventGUID Type: **const GUID\***
     * 
     * Specifies a pointer to the event identifier that the application is registering for. See [WIA Event Identifiers](-wia-wia-event-identifiers.md) for standard event identifiers.
     * @param {IWiaEventCallback} pIWiaEventCallback Type: **[**IWiaEventCallback**](/windows/desktop/api/wia_xp/nn-wia_xp-iwiaeventcallback)\***
     * 
     * Specifies a pointer to the [**IWiaEventCallback**](/windows/desktop/api/wia_xp/nn-wia_xp-iwiaeventcallback) interface that the WIA 2.0 uses to send event notification.
     * @returns {IUnknown} Type: **[IUnknown](/windows/win32/api/unknwn/nn-unknwn-iunknown)\*\***
     * 
     * Receives the address of a pointer to the [IUnknown](/windows/win32/api/unknwn/nn-unknwn-iunknown) interface.
     * @see https://learn.microsoft.com/windows/win32/ktop-src/wia/-wia-iwiadevmgr2-registereventcallbackinterface
     */
    RegisterEventCallbackInterface(lFlags, bstrDeviceID, pEventGUID, pIWiaEventCallback) {
        if(bstrDeviceID is String) {
            pin := BSTR.Alloc(bstrDeviceID)
            bstrDeviceID := pin.Value
        }

        result := ComCall(7, this, "int", lFlags, "ptr", bstrDeviceID, "ptr", pEventGUID, "ptr", pIWiaEventCallback, "ptr*", &pEventObject := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IUnknown(pEventObject)
    }

    /**
     * The IWiaDevMgr2::RegisterEventCallbackProgram method registers an application to receive device events. It is primarily provided for backward compatibility with applications that were not written for Windows Image Acquisition (WIA) 2.0.
     * @remarks
     * Use **IWiaDevMgr2::RegisterEventCallbackProgram** to register for hardware device events. When an event occurs that an application is registered for, the application is launched, and the event information is transmitted to the application.
     * 
     * Use the [**EnumRegisterEventInfo**](-wia-iwiaitem2-enumregistereventinfo.md) method to retrieve a pointer to an enumerator object for event registration properties.
     * 
     * Only use the **IWiaDevMgr2::RegisterEventCallbackProgram** method for backward compatibility with applications not written for the WIA 2.0 architecture. Use the Component Object Model (COM) interfaces provided by the WIA 2.0 architecture for new applications. Specifically, call [**IWiaDevMgr2::RegisterEventCallbackInterface**](-wia-iwiadevmgr2-registereventcallbackinterface.md) or [**IWiaDevMgr2::RegisterEventCallbackCLSID**](-wia-iwiadevmgr2-registereventcallbackclsid.md) to register a new application for device events.
     * 
     * Typically, this method is called by an install program or a script. The install program or script registers the application to receive WIA 2.0 device events. When the event occurs, the application is started by the WIA 2.0 run-time system.
     * @param {Integer} lFlags Type: **LONG**
     * 
     * The registration flags. Can be set to the following values.
     * 
     * 
     * 
     * | Value                                                                                                                                                                                                           | Meaning                                                      |
     * |-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|--------------------------------------------------------------|
     * | <span id="WIA_REGISTER_EVENT_CALLBACK"></span><span id="wia_register_event_callback"></span><dl> <dt>**WIA\_REGISTER\_EVENT\_CALLBACK**</dt> </dl>       | Register for the event.<br/>                           |
     * | <span id="WIA_UNREGISTER_EVENT_CALLBACK"></span><span id="wia_unregister_event_callback"></span><dl> <dt>**WIA\_UNREGISTER\_EVENT\_CALLBACK**</dt> </dl> | Delete the registration for the event.<br/>            |
     * | <span id="WIA_SET_DEFAULT_HANDLER"></span><span id="wia_set_default_handler"></span><dl> <dt>**WIA\_SET\_DEFAULT\_HANDLER**</dt> </dl>                   | Set the application as the default event handler.<br/> |
     * @param {BSTR} bstrDeviceID Type: **BSTR**
     * 
     * A device identifier. Pass **NULL** to register for the event on all WIA 2.0 devices.
     * @param {Pointer<Guid>} pEventGUID Type: **const GUID\***
     * 
     * The event that the application is registering for. For a list of valid event GUIDs, see [WIA Event Identifiers](-wia-wia-event-identifiers.md).
     * @param {BSTR} bstrFullAppName Type: **BSTR**
     * 
     * The full path name of the application.
     * @param {BSTR} bstrCommandLineArg 
     * @param {BSTR} bstrName Type: **BSTR**
     * 
     * The name of the application. The name is displayed to the user when multiple applications register for the same event.
     * @param {BSTR} bstrDescription Type: **BSTR**
     * 
     * The description of the application. The description is displayed to the user when multiple applications register for the same event.
     * @param {BSTR} bstrIcon Type: **BSTR**
     * 
     * The icon that represents the application. The icon is displayed to the user when multiple applications register for the same event. The string contains the name of the application and the zero-based index of the icon separated by a comma, for example, "MyApp, 0". There might be more than one icon that represents an application.
     * @returns {HRESULT} Type: **HRESULT**
     * 
     * If this method succeeds, it returns **S\_OK**. Otherwise, it returns an **HRESULT** error code.
     * @see https://learn.microsoft.com/windows/win32/ktop-src/wia/-wia-iwiadevmgr2-registereventcallbackprogram
     */
    RegisterEventCallbackProgram(lFlags, bstrDeviceID, pEventGUID, bstrFullAppName, bstrCommandLineArg, bstrName, bstrDescription, bstrIcon) {
        if(bstrDeviceID is String) {
            pin := BSTR.Alloc(bstrDeviceID)
            bstrDeviceID := pin.Value
        }
        if(bstrFullAppName is String) {
            pin := BSTR.Alloc(bstrFullAppName)
            bstrFullAppName := pin.Value
        }
        if(bstrCommandLineArg is String) {
            pin := BSTR.Alloc(bstrCommandLineArg)
            bstrCommandLineArg := pin.Value
        }
        if(bstrName is String) {
            pin := BSTR.Alloc(bstrName)
            bstrName := pin.Value
        }
        if(bstrDescription is String) {
            pin := BSTR.Alloc(bstrDescription)
            bstrDescription := pin.Value
        }
        if(bstrIcon is String) {
            pin := BSTR.Alloc(bstrIcon)
            bstrIcon := pin.Value
        }

        result := ComCall(8, this, "int", lFlags, "ptr", bstrDeviceID, "ptr", pEventGUID, "ptr", bstrFullAppName, "ptr", bstrCommandLineArg, "ptr", bstrName, "ptr", bstrDescription, "ptr", bstrIcon, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The IWiaDevMgr2::RegisterEventCallbackCLSID method registers an application to receive events even if the application is not running.
     * @remarks
     * WIA 2.0 applications use this method to register to receive hardware device events. After **IWiaDevMgr2::RegisterEventCallbackCLSID** is called, the application is registered to receive WIA 2.0 device events even if it is not running.
     * 
     * When the event occurs, the WIA 2.0 system determines which application is registered to receive the event. It uses the [CoCreateInstance](/windows/win32/api/combaseapi/nf-combaseapi-cocreateinstance) function and the CLSID specified in the *pClsID* parameter to create an instance of the application, and then calls the [**ImageEventCallback**](/windows/desktop/api/wia_xp/nf-wia_xp-iwiaeventcallback-imageeventcallback) method to transmit the event information to the application.
     * 
     * An application can invoke the [**EnumRegisterEventInfo**](-wia-iwiaitem2-enumregistereventinfo.md) method to enumerate event registration information.
     * 
     * If the application is not a registered Component Object Model (COM) component and is not compatible with the WIA 2.0 architecture, use the [**IWiaDevMgr2::RegisterEventCallbackProgram**](-wia-iwiadevmgr2-registereventcallbackprogram.md) method to register an application for device events.
     * 
     * > [!Note]  
     * > In a multi-threaded application, there is no guarantee that the event notification callback is returned on the same thread that registered the callback.
     * @param {Integer} lFlags Type: **LONG**
     * 
     * Specifies registration flags. Can be set to the following values:
     * 
     * 
     * 
     * | Registration Flag                | Meaning                                           |
     * |----------------------------------|---------------------------------------------------|
     * | WIA\_REGISTER\_EVENT\_CALLBACK   | Register for the event.                           |
     * | WIA\_UNREGISTER\_EVENT\_CALLBACK | Delete the registration for the event.            |
     * | WIA\_SET\_DEFAULT\_HANDLER       | Set the application as the default event handler. |
     * @param {BSTR} bstrDeviceID Type: **BSTR**
     * 
     * Specifies a device identifier. Pass **NULL** to register for the event on all WIA 2.0 devices.
     * @param {Pointer<Guid>} pEventGUID Type: **const GUID\***
     * 
     * Specifies the event that the application is registering for. For a list of standard events, see [WIA Event Identifiers](-wia-wia-event-identifiers.md).
     * @param {Pointer<Guid>} pClsID Type: **const GUID\***
     * 
     * Pointer to the application class ID (**CLSID**). The WIA 2.0 run-time system uses the application **CLSID** to start the application when an event occurs that it is registered for.
     * @param {BSTR} bstrName Type: **BSTR**
     * 
     * Specifies the name of the application that registers for the event.
     * @param {BSTR} bstrDescription Type: **BSTR**
     * 
     * Specifies a text description of the application that registers for the event.
     * @param {BSTR} bstrIcon Type: **BSTR**
     * 
     * Specifies the name of an image file to use for the icon for the application that registers for the event.
     * @returns {HRESULT} Type: **HRESULT**
     * 
     * If this method succeeds, it returns **S\_OK**. Otherwise, it returns an **HRESULT** error code.
     * @see https://learn.microsoft.com/windows/win32/ktop-src/wia/-wia-iwiadevmgr2-registereventcallbackclsid
     */
    RegisterEventCallbackCLSID(lFlags, bstrDeviceID, pEventGUID, pClsID, bstrName, bstrDescription, bstrIcon) {
        if(bstrDeviceID is String) {
            pin := BSTR.Alloc(bstrDeviceID)
            bstrDeviceID := pin.Value
        }
        if(bstrName is String) {
            pin := BSTR.Alloc(bstrName)
            bstrName := pin.Value
        }
        if(bstrDescription is String) {
            pin := BSTR.Alloc(bstrDescription)
            bstrDescription := pin.Value
        }
        if(bstrIcon is String) {
            pin := BSTR.Alloc(bstrIcon)
            bstrIcon := pin.Value
        }

        result := ComCall(9, this, "int", lFlags, "ptr", bstrDeviceID, "ptr", pEventGUID, "ptr", pClsID, "ptr", bstrName, "ptr", bstrDescription, "ptr", bstrIcon, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The IWiaDevMgr2::GetImageDlg method displays one or more dialog boxes that enable a user to acquire an image from a Windows Image Acquisition (WIA) 2.0 device and write the image to a specified file.
     * @remarks
     * If the application passes **NULL** for the value of the *bstrDeviceID* parameter, **IWiaDevMgr2::GetImageDlg** displays the **Select Device** dialog box so that the user can select the WIA 2.0 input device.
     * 
     * Use a menu item named **From scanner** on the **File** menu so that device and image selections are available in your application.
     * 
     * Call [SysFreeString](/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysfreestring) on each BSTR in the array that *ppbstrFilePaths*\[i\] points to, and call [CoTaskMemFree](/windows/win32/api/combaseapi/nf-combaseapi-cotaskmemfree) on the array itself to free associated memory. If S\_FALSE is returned, check to see if the value that *plNumFiles* points to is not zero. If the value is not zero, free the *ppbstrFilePaths*\[i\] resources in the application, because the user might cancel after scanning one or more pages. Initialize *plNumFiles* to zero before you call **IWiaDevMgr2::GetImageDlg**. If *plNumFiles* is not initialized to zero and a failure in the COM infrastructure causes the function to return S\_FALSE before **IWiaDevMgr2::GetImageDlg** is called, then *plNumFiles* will have a misleading garbage value.
     * 
     * The dialog box must have sufficient rights to *bstrFolderName* so that it can save the files with unique file names. Protect the folder with an access control list (ACL) because it contains user data.
     * @param {Integer} lFlags Type: **LONG**
     * 
     * Specifies dialog box behavior. Can be set to the following values:
     * 
     * 
     * 
     * | Flag                                 | Meaning                                                                                                                                                                     |
     * |--------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
     * | 0                                    | Default behavior.                                                                                                                                                           |
     * | WIA\_DEVICE\_DIALOG\_USE\_COMMON\_UI | Use the system UI instead of the vendor-supplied UI. If the system UI is not available, the vendor UI is used. If neither UI is available, the function returns E\_NOTIMPL. |
     * @param {BSTR} bstrDeviceID Type: **BSTR**
     * 
     * Specifies the scanner to use.
     * @param {HWND} hwndParent Type: **HWND**
     * 
     * A handle of the window that owns the **Get Image** dialog box.
     * @param {BSTR} bstrFolderName Type: **BSTR**
     * 
     * Specifies the name of the folder ito store the scanned files in.
     * @param {BSTR} bstrFilename Type: **BSTR**
     * 
     * Specifies the name of the file to write the image data to.
     * @param {Pointer<Integer>} plNumFiles Type: **LONG\***
     * 
     * A pointer to the number of files to scan.
     * @param {Pointer<Pointer<BSTR>>} ppbstrFilePaths Type: **BSTR\*\***
     * 
     * The address of a pointer to an array of paths for the scanned files. Initialize the pointer to point to an array of size zero (0) before **IWiaDevMgr2::GetImageDlg** is called. See **Remarks**.
     * @returns {IWiaItem2} Type: **[**IWiaItem2**](-wia-iwiaitem2.md)\*\***
     * 
     * The address of a pointer to the [**IWiaItem2**](-wia-iwiaitem2.md) that the images were scanned from.
     * @see https://learn.microsoft.com/windows/win32/ktop-src/wia/-wia-iwiadevmgr2-getimagedlg
     */
    GetImageDlg(lFlags, bstrDeviceID, hwndParent, bstrFolderName, bstrFilename, plNumFiles, ppbstrFilePaths) {
        if(bstrDeviceID is String) {
            pin := BSTR.Alloc(bstrDeviceID)
            bstrDeviceID := pin.Value
        }
        hwndParent := hwndParent is Win32Handle ? NumGet(hwndParent, "ptr") : hwndParent
        if(bstrFolderName is String) {
            pin := BSTR.Alloc(bstrFolderName)
            bstrFolderName := pin.Value
        }
        if(bstrFilename is String) {
            pin := BSTR.Alloc(bstrFilename)
            bstrFilename := pin.Value
        }

        plNumFilesMarshal := plNumFiles is VarRef ? "int*" : "ptr"
        ppbstrFilePathsMarshal := ppbstrFilePaths is VarRef ? "ptr*" : "ptr"

        result := ComCall(10, this, "int", lFlags, "ptr", bstrDeviceID, "ptr", hwndParent, "ptr", bstrFolderName, "ptr", bstrFilename, plNumFilesMarshal, plNumFiles, ppbstrFilePathsMarshal, ppbstrFilePaths, "ptr*", &ppItem := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IWiaItem2(ppItem)
    }
}
