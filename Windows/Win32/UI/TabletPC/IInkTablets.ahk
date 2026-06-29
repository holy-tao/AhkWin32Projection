#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import ".\IInkTablet.ahk" { IInkTablet }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * . (IInkTablets)
 * @remarks
 * Creating the InkCollector control behind a transparent control (such as a GroupBox with the WS_EX_TRANSPARENT property set) will prevent InkCollector from collecting ink.
 * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nn-msinkaut-iinktablets
 * @namespace Windows.Win32.UI.TabletPC
 */
export default struct IInkTablets extends IDispatch {
    /**
     * The interface identifier for IInkTablets
     * @type {Guid}
     */
    static IID := Guid("{112086d9-7779-4535-a699-862b43ac1863}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IInkTablets interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_Count                 : IntPtr
        get__NewEnum              : IntPtr
        get_DefaultTablet         : IntPtr
        Item                      : IntPtr
        IsPacketPropertySupported : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IInkTablets.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Integer} 
     */
    Count {
        get => this.get_Count()
    }

    /**
     * @type {IUnknown} 
     */
    _NewEnum {
        get => this.get__NewEnum()
    }

    /**
     * @type {IInkTablet} 
     */
    DefaultTablet {
        get => this.get_DefaultTablet()
    }

    /**
     * Gets the number of objects or collections contained in a collection. (IInkTablets.get_Count)
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinktablets-get_count
     */
    get_Count() {
        result := ComCall(7, this, "int*", &Count := 0, "HRESULT")
        return Count
    }

    /**
     * 
     * @returns {IUnknown} 
     */
    get__NewEnum() {
        result := ComCall(8, this, "ptr*", &_NewEnum := 0, "HRESULT")
        return IUnknown(_NewEnum)
    }

    /**
     * Gets the default tablet within the set of available tablets.
     * @remarks
     * The platform determines the default <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nn-msinkaut-iinktablet">IInkTablet</a> object in the following order:
     * 
     * <ul>
     * <li>If the system has a digitizer integrated with the display device, this integrated digitizer is considered the default tablet, even if other digitizing tablets are installed.</li>
     * <li>If more than one digitizing tablet is installed in the system, the first one encountered during initialization is considered the default tablet.</li>
     * <li>If only one digitizing tablet is installed in the system, it is considered the default tablet.</li>
     * <li>If no digitizing tablets are installed in the system but there are other pointing devices (such as a mouse or a touch pad) installed that generate mouse messages, those devices in aggregate are considered to be the default tablet.</li>
     * <li>If no digitizing tablets and no pointing devices are installed in the system, no default tablet can be returned.</li>
     * </ul>
     * <div class="alert"><b>Note</b>  Accessing this property within certain message handlers can result in the underlying function being re-entered, causing unexpected results. Take care to avoid a reentrant call when handling any of the following messages: <b>WM_ACTIVATE</b>, <b>WM_ACTIVATEAPP</b>, <b>WM_NCACTIVATE</b>, <b>WM_PAINT</b>; <b>WM_SYSCOMMAND</b> if <i>wParam</i> is set to SC_HOTKEY or SC_TASKLIST; and <b>WM_SYSKEYDOWN</b> (when processing Alt-Tab or Alt-Esc key combinations). This is an issue with single-threaded apartment model applications.</div>
     * <div> </div>
     * @returns {IInkTablet} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinktablets-get_defaulttablet
     */
    get_DefaultTablet() {
        result := ComCall(9, this, "ptr*", &DefaultTablet := 0, "HRESULT")
        return IInkTablet(DefaultTablet)
    }

    /**
     * Retrieves the IInkTablet object at the specified index within the InkTablets collection.
     * @remarks
     * An error occurs if the index doesn't match any existing member of the collection.
     * 
     * <div class="alert"><b>Note</b>  This function can be re-entered when called within certain message handlers, causing unexpected results. Take care to avoid a reentrant call when handling any of the following messages: <b>WM_ACTIVATE</b>, <b>WM_ACTIVATEAPP</b>, <b>WM_NCACTIVATE</b>, <b>WM_PAINT</b>; <b>WM_SYSCOMMAND</b> if <i>wParam</i> is set to SC_HOTKEY or SC_TASKLIST; and <b>WM_SYSKEYDOWN</b> (when processing Alt-Tab or Alt-Esc key combinations). This is an issue with single-threaded apartment model applications.</div>
     * <div> </div>
     * @param {Integer} Index The zero-based index of the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nn-msinkaut-iinktablet">IInkTablet</a> object to get.
     * @returns {IInkTablet} When this method returns, contains a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nn-msinkaut-iinktablet">IInkTablet</a> object at the specified index within the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms704832(v=vs.85)">InkTablets</a> collection.
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinktablets-item
     */
    Item(Index) {
        result := ComCall(10, this, "int", Index, "ptr*", &Tablet := 0, "HRESULT")
        return IInkTablet(Tablet)
    }

    /**
     * Determines whether a property of a tablet device or a collection of tablet devices, identified with a globally unique identifier (GUID), is supported. (IInkTablets.IsPacketPropertySupported)
     * @remarks
     * <div class="alert"><b>Note</b>  When this method is called on the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms704832(v=vs.85)">InkTablets</a> collection, it queries all of the tablets on the system. If any of them does not support the property, it returns <b>VARIANT_FALSE</b>. Call <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinktablet-ispacketpropertysupported">IsPacketPropertySupported</a> on an individual <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nn-msinkaut-iinktablet">IInkTablet</a> object to determine whether the device supports a known property.</div>
     * <div> </div>
     * @param {BSTR} packetPropertyName The GUID for the <a href="https://docs.microsoft.com/windows/desktop/tablet/packetproperty-guids">PacketProperty GUIDs</a> of the tablet or tablets that is requested. Use a defined BSTR constant from the <a href="https://docs.microsoft.com/windows/desktop/tablet/packetpropertyguids-constants">PacketProperty</a> constants.
     * 
     * For more information about the BSTR data type, see <a href="https://docs.microsoft.com/windows/desktop/tablet/using-the-com-library">Using the COM Library</a>.
     * @returns {VARIANT_BOOL} When this method returns, contains <b>VARIANT_TRUE</b> if a known property is supported by the tablet or tablets; otherwise, <b>VARIANT_FALSE</b>.
     * 
     * <div class="alert"><b>Note</b>  This method can be re-entered when called within certain message handlers, causing unexpected results. Take care to avoid a reentrant call when handling any of the following messages: WM_ACTIVATE, WM_ACTIVATEAPP, WM_NCACTIVATE, WM_PAINT; WM_SYSCOMMAND if <i>wParam</i> is set to SC_HOTKEY or SC_TASKLIST; and WM_SYSKEYDOWN (when processing Alt-Tab or Alt-Esc key combinations). This is an issue with single-threaded apartment model applications.</div>
     * <div> </div>
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinktablets-ispacketpropertysupported
     */
    IsPacketPropertySupported(packetPropertyName) {
        packetPropertyName := packetPropertyName is String ? BSTR.Alloc(packetPropertyName).Value : packetPropertyName

        result := ComCall(11, this, BSTR, packetPropertyName, VARIANT_BOOL.Ptr, &Supported := 0, "HRESULT")
        return Supported
    }

    Query(iid) {
        if (IInkTablets.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Count := CallbackCreate(GetMethod(implObj, "get_Count"), flags, 2)
        this.vtbl.get__NewEnum := CallbackCreate(GetMethod(implObj, "get__NewEnum"), flags, 2)
        this.vtbl.get_DefaultTablet := CallbackCreate(GetMethod(implObj, "get_DefaultTablet"), flags, 2)
        this.vtbl.Item := CallbackCreate(GetMethod(implObj, "Item"), flags, 3)
        this.vtbl.IsPacketPropertySupported := CallbackCreate(GetMethod(implObj, "IsPacketPropertySupported"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Count)
        CallbackFree(this.vtbl.get__NewEnum)
        CallbackFree(this.vtbl.get_DefaultTablet)
        CallbackFree(this.vtbl.Item)
        CallbackFree(this.vtbl.IsPacketPropertySupported)
    }
}
