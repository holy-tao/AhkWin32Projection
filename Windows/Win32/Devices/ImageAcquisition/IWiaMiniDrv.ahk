#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\MINIDRV_TRANSFER_CONTEXT.ahk" { MINIDRV_TRANSFER_CONTEXT }
#Import ".\WIA_FORMAT_INFO.ahk" { WIA_FORMAT_INFO }
#Import "..\..\System\Com\StructuredStorage\PROPSPEC.ahk" { PROPSPEC }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\IWiaDrvItem.ahk" { IWiaDrvItem }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\WIA_DEV_CAP_DRV.ahk" { WIA_DEV_CAP_DRV }

/**
 * @namespace Windows.Win32.Devices.ImageAcquisition
 */
export default struct IWiaMiniDrv extends IUnknown {
    /**
     * The interface identifier for IWiaMiniDrv
     * @type {Guid}
     */
    static IID := Guid("{d8cdee14-3c6c-11d2-9a35-00c04fa36145}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWiaMiniDrv interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        drvInitializeWia          : IntPtr
        drvAcquireItemData        : IntPtr
        drvInitItemProperties     : IntPtr
        drvValidateItemProperties : IntPtr
        drvWriteItemProperties    : IntPtr
        drvReadItemProperties     : IntPtr
        drvLockWiaDevice          : IntPtr
        drvUnLockWiaDevice        : IntPtr
        drvAnalyzeItem            : IntPtr
        drvGetDeviceErrorStr      : IntPtr
        drvDeviceCommand          : IntPtr
        drvGetCapabilities        : IntPtr
        drvDeleteItem             : IntPtr
        drvFreeDrvItemContext     : IntPtr
        drvGetWiaFormatInfo       : IntPtr
        drvNotifyPnpEvent         : IntPtr
        drvUnInitializeWia        : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWiaMiniDrv.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer<Integer>} __MIDL__IWiaMiniDrv0000 
     * @param {Integer} __MIDL__IWiaMiniDrv0001 
     * @param {BSTR} __MIDL__IWiaMiniDrv0002 
     * @param {BSTR} __MIDL__IWiaMiniDrv0003 
     * @param {IUnknown} __MIDL__IWiaMiniDrv0004 
     * @param {IUnknown} __MIDL__IWiaMiniDrv0005 
     * @param {Pointer<IWiaDrvItem>} __MIDL__IWiaMiniDrv0006 
     * @param {Pointer<IUnknown>} __MIDL__IWiaMiniDrv0007 
     * @param {Pointer<Integer>} __MIDL__IWiaMiniDrv0008 
     * @returns {HRESULT} 
     */
    drvInitializeWia(__MIDL__IWiaMiniDrv0000, __MIDL__IWiaMiniDrv0001, __MIDL__IWiaMiniDrv0002, __MIDL__IWiaMiniDrv0003, __MIDL__IWiaMiniDrv0004, __MIDL__IWiaMiniDrv0005, __MIDL__IWiaMiniDrv0006, __MIDL__IWiaMiniDrv0007, __MIDL__IWiaMiniDrv0008) {
        __MIDL__IWiaMiniDrv0002 := __MIDL__IWiaMiniDrv0002 is String ? BSTR.Alloc(__MIDL__IWiaMiniDrv0002).Value : __MIDL__IWiaMiniDrv0002
        __MIDL__IWiaMiniDrv0003 := __MIDL__IWiaMiniDrv0003 is String ? BSTR.Alloc(__MIDL__IWiaMiniDrv0003).Value : __MIDL__IWiaMiniDrv0003

        __MIDL__IWiaMiniDrv0000Marshal := __MIDL__IWiaMiniDrv0000 is VarRef ? "char*" : "ptr"
        __MIDL__IWiaMiniDrv0008Marshal := __MIDL__IWiaMiniDrv0008 is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, __MIDL__IWiaMiniDrv0000Marshal, __MIDL__IWiaMiniDrv0000, "int", __MIDL__IWiaMiniDrv0001, BSTR, __MIDL__IWiaMiniDrv0002, BSTR, __MIDL__IWiaMiniDrv0003, "ptr", __MIDL__IWiaMiniDrv0004, "ptr", __MIDL__IWiaMiniDrv0005, IWiaDrvItem.Ptr, __MIDL__IWiaMiniDrv0006, IUnknown.Ptr, __MIDL__IWiaMiniDrv0007, __MIDL__IWiaMiniDrv0008Marshal, __MIDL__IWiaMiniDrv0008, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} __MIDL__IWiaMiniDrv0009 
     * @param {Integer} __MIDL__IWiaMiniDrv0010 
     * @param {Pointer<MINIDRV_TRANSFER_CONTEXT>} __MIDL__IWiaMiniDrv0011 
     * @returns {Integer} 
     */
    drvAcquireItemData(__MIDL__IWiaMiniDrv0009, __MIDL__IWiaMiniDrv0010, __MIDL__IWiaMiniDrv0011) {
        __MIDL__IWiaMiniDrv0009Marshal := __MIDL__IWiaMiniDrv0009 is VarRef ? "char*" : "ptr"

        result := ComCall(4, this, __MIDL__IWiaMiniDrv0009Marshal, __MIDL__IWiaMiniDrv0009, "int", __MIDL__IWiaMiniDrv0010, MINIDRV_TRANSFER_CONTEXT.Ptr, __MIDL__IWiaMiniDrv0011, "int*", &__MIDL__IWiaMiniDrv0012 := 0, "HRESULT")
        return __MIDL__IWiaMiniDrv0012
    }

    /**
     * 
     * @param {Pointer<Integer>} __MIDL__IWiaMiniDrv0013 
     * @param {Integer} __MIDL__IWiaMiniDrv0014 
     * @returns {Integer} 
     */
    drvInitItemProperties(__MIDL__IWiaMiniDrv0013, __MIDL__IWiaMiniDrv0014) {
        __MIDL__IWiaMiniDrv0013Marshal := __MIDL__IWiaMiniDrv0013 is VarRef ? "char*" : "ptr"

        result := ComCall(5, this, __MIDL__IWiaMiniDrv0013Marshal, __MIDL__IWiaMiniDrv0013, "int", __MIDL__IWiaMiniDrv0014, "int*", &__MIDL__IWiaMiniDrv0015 := 0, "HRESULT")
        return __MIDL__IWiaMiniDrv0015
    }

    /**
     * 
     * @param {Pointer<Integer>} __MIDL__IWiaMiniDrv0016 
     * @param {Integer} __MIDL__IWiaMiniDrv0017 
     * @param {Integer} __MIDL__IWiaMiniDrv0018 
     * @param {Pointer<PROPSPEC>} __MIDL__IWiaMiniDrv0019 
     * @returns {Integer} 
     */
    drvValidateItemProperties(__MIDL__IWiaMiniDrv0016, __MIDL__IWiaMiniDrv0017, __MIDL__IWiaMiniDrv0018, __MIDL__IWiaMiniDrv0019) {
        __MIDL__IWiaMiniDrv0016Marshal := __MIDL__IWiaMiniDrv0016 is VarRef ? "char*" : "ptr"

        result := ComCall(6, this, __MIDL__IWiaMiniDrv0016Marshal, __MIDL__IWiaMiniDrv0016, "int", __MIDL__IWiaMiniDrv0017, "uint", __MIDL__IWiaMiniDrv0018, PROPSPEC.Ptr, __MIDL__IWiaMiniDrv0019, "int*", &__MIDL__IWiaMiniDrv0020 := 0, "HRESULT")
        return __MIDL__IWiaMiniDrv0020
    }

    /**
     * 
     * @param {Pointer<Integer>} __MIDL__IWiaMiniDrv0021 
     * @param {Integer} __MIDL__IWiaMiniDrv0022 
     * @param {Pointer<MINIDRV_TRANSFER_CONTEXT>} __MIDL__IWiaMiniDrv0023 
     * @returns {Integer} 
     */
    drvWriteItemProperties(__MIDL__IWiaMiniDrv0021, __MIDL__IWiaMiniDrv0022, __MIDL__IWiaMiniDrv0023) {
        __MIDL__IWiaMiniDrv0021Marshal := __MIDL__IWiaMiniDrv0021 is VarRef ? "char*" : "ptr"

        result := ComCall(7, this, __MIDL__IWiaMiniDrv0021Marshal, __MIDL__IWiaMiniDrv0021, "int", __MIDL__IWiaMiniDrv0022, MINIDRV_TRANSFER_CONTEXT.Ptr, __MIDL__IWiaMiniDrv0023, "int*", &__MIDL__IWiaMiniDrv0024 := 0, "HRESULT")
        return __MIDL__IWiaMiniDrv0024
    }

    /**
     * 
     * @param {Pointer<Integer>} __MIDL__IWiaMiniDrv0025 
     * @param {Integer} __MIDL__IWiaMiniDrv0026 
     * @param {Integer} __MIDL__IWiaMiniDrv0027 
     * @param {Pointer<PROPSPEC>} __MIDL__IWiaMiniDrv0028 
     * @returns {Integer} 
     */
    drvReadItemProperties(__MIDL__IWiaMiniDrv0025, __MIDL__IWiaMiniDrv0026, __MIDL__IWiaMiniDrv0027, __MIDL__IWiaMiniDrv0028) {
        __MIDL__IWiaMiniDrv0025Marshal := __MIDL__IWiaMiniDrv0025 is VarRef ? "char*" : "ptr"

        result := ComCall(8, this, __MIDL__IWiaMiniDrv0025Marshal, __MIDL__IWiaMiniDrv0025, "int", __MIDL__IWiaMiniDrv0026, "uint", __MIDL__IWiaMiniDrv0027, PROPSPEC.Ptr, __MIDL__IWiaMiniDrv0028, "int*", &__MIDL__IWiaMiniDrv0029 := 0, "HRESULT")
        return __MIDL__IWiaMiniDrv0029
    }

    /**
     * 
     * @param {Pointer<Integer>} __MIDL__IWiaMiniDrv0030 
     * @param {Integer} __MIDL__IWiaMiniDrv0031 
     * @returns {Integer} 
     */
    drvLockWiaDevice(__MIDL__IWiaMiniDrv0030, __MIDL__IWiaMiniDrv0031) {
        __MIDL__IWiaMiniDrv0030Marshal := __MIDL__IWiaMiniDrv0030 is VarRef ? "char*" : "ptr"

        result := ComCall(9, this, __MIDL__IWiaMiniDrv0030Marshal, __MIDL__IWiaMiniDrv0030, "int", __MIDL__IWiaMiniDrv0031, "int*", &__MIDL__IWiaMiniDrv0032 := 0, "HRESULT")
        return __MIDL__IWiaMiniDrv0032
    }

    /**
     * 
     * @param {Pointer<Integer>} __MIDL__IWiaMiniDrv0033 
     * @param {Integer} __MIDL__IWiaMiniDrv0034 
     * @returns {Integer} 
     */
    drvUnLockWiaDevice(__MIDL__IWiaMiniDrv0033, __MIDL__IWiaMiniDrv0034) {
        __MIDL__IWiaMiniDrv0033Marshal := __MIDL__IWiaMiniDrv0033 is VarRef ? "char*" : "ptr"

        result := ComCall(10, this, __MIDL__IWiaMiniDrv0033Marshal, __MIDL__IWiaMiniDrv0033, "int", __MIDL__IWiaMiniDrv0034, "int*", &__MIDL__IWiaMiniDrv0035 := 0, "HRESULT")
        return __MIDL__IWiaMiniDrv0035
    }

    /**
     * 
     * @param {Pointer<Integer>} __MIDL__IWiaMiniDrv0036 
     * @param {Integer} __MIDL__IWiaMiniDrv0037 
     * @param {Pointer<Integer>} __MIDL__IWiaMiniDrv0038 
     * @returns {HRESULT} 
     */
    drvAnalyzeItem(__MIDL__IWiaMiniDrv0036, __MIDL__IWiaMiniDrv0037, __MIDL__IWiaMiniDrv0038) {
        __MIDL__IWiaMiniDrv0036Marshal := __MIDL__IWiaMiniDrv0036 is VarRef ? "char*" : "ptr"
        __MIDL__IWiaMiniDrv0038Marshal := __MIDL__IWiaMiniDrv0038 is VarRef ? "int*" : "ptr"

        result := ComCall(11, this, __MIDL__IWiaMiniDrv0036Marshal, __MIDL__IWiaMiniDrv0036, "int", __MIDL__IWiaMiniDrv0037, __MIDL__IWiaMiniDrv0038Marshal, __MIDL__IWiaMiniDrv0038, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} __MIDL__IWiaMiniDrv0039 
     * @param {Integer} __MIDL__IWiaMiniDrv0040 
     * @param {Pointer<PWSTR>} __MIDL__IWiaMiniDrv0041 
     * @param {Pointer<Integer>} __MIDL__IWiaMiniDrv0042 
     * @returns {HRESULT} 
     */
    drvGetDeviceErrorStr(__MIDL__IWiaMiniDrv0039, __MIDL__IWiaMiniDrv0040, __MIDL__IWiaMiniDrv0041, __MIDL__IWiaMiniDrv0042) {
        __MIDL__IWiaMiniDrv0041Marshal := __MIDL__IWiaMiniDrv0041 is VarRef ? "ptr*" : "ptr"
        __MIDL__IWiaMiniDrv0042Marshal := __MIDL__IWiaMiniDrv0042 is VarRef ? "int*" : "ptr"

        result := ComCall(12, this, "int", __MIDL__IWiaMiniDrv0039, "int", __MIDL__IWiaMiniDrv0040, __MIDL__IWiaMiniDrv0041Marshal, __MIDL__IWiaMiniDrv0041, __MIDL__IWiaMiniDrv0042Marshal, __MIDL__IWiaMiniDrv0042, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} __MIDL__IWiaMiniDrv0043 
     * @param {Integer} __MIDL__IWiaMiniDrv0044 
     * @param {Pointer<Guid>} __MIDL__IWiaMiniDrv0045 
     * @param {Pointer<IWiaDrvItem>} __MIDL__IWiaMiniDrv0046 
     * @param {Pointer<Integer>} __MIDL__IWiaMiniDrv0047 
     * @returns {HRESULT} 
     */
    drvDeviceCommand(__MIDL__IWiaMiniDrv0043, __MIDL__IWiaMiniDrv0044, __MIDL__IWiaMiniDrv0045, __MIDL__IWiaMiniDrv0046, __MIDL__IWiaMiniDrv0047) {
        __MIDL__IWiaMiniDrv0043Marshal := __MIDL__IWiaMiniDrv0043 is VarRef ? "char*" : "ptr"
        __MIDL__IWiaMiniDrv0047Marshal := __MIDL__IWiaMiniDrv0047 is VarRef ? "int*" : "ptr"

        result := ComCall(13, this, __MIDL__IWiaMiniDrv0043Marshal, __MIDL__IWiaMiniDrv0043, "int", __MIDL__IWiaMiniDrv0044, Guid.Ptr, __MIDL__IWiaMiniDrv0045, IWiaDrvItem.Ptr, __MIDL__IWiaMiniDrv0046, __MIDL__IWiaMiniDrv0047Marshal, __MIDL__IWiaMiniDrv0047, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} __MIDL__IWiaMiniDrv0048 
     * @param {Integer} __MIDL__IWiaMiniDrv0049 
     * @param {Pointer<Integer>} __MIDL__IWiaMiniDrv0050 
     * @param {Pointer<Pointer<WIA_DEV_CAP_DRV>>} __MIDL__IWiaMiniDrv0051 
     * @param {Pointer<Integer>} __MIDL__IWiaMiniDrv0052 
     * @returns {HRESULT} 
     */
    drvGetCapabilities(__MIDL__IWiaMiniDrv0048, __MIDL__IWiaMiniDrv0049, __MIDL__IWiaMiniDrv0050, __MIDL__IWiaMiniDrv0051, __MIDL__IWiaMiniDrv0052) {
        __MIDL__IWiaMiniDrv0048Marshal := __MIDL__IWiaMiniDrv0048 is VarRef ? "char*" : "ptr"
        __MIDL__IWiaMiniDrv0050Marshal := __MIDL__IWiaMiniDrv0050 is VarRef ? "int*" : "ptr"
        __MIDL__IWiaMiniDrv0051Marshal := __MIDL__IWiaMiniDrv0051 is VarRef ? "ptr*" : "ptr"
        __MIDL__IWiaMiniDrv0052Marshal := __MIDL__IWiaMiniDrv0052 is VarRef ? "int*" : "ptr"

        result := ComCall(14, this, __MIDL__IWiaMiniDrv0048Marshal, __MIDL__IWiaMiniDrv0048, "int", __MIDL__IWiaMiniDrv0049, __MIDL__IWiaMiniDrv0050Marshal, __MIDL__IWiaMiniDrv0050, __MIDL__IWiaMiniDrv0051Marshal, __MIDL__IWiaMiniDrv0051, __MIDL__IWiaMiniDrv0052Marshal, __MIDL__IWiaMiniDrv0052, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} __MIDL__IWiaMiniDrv0053 
     * @param {Integer} __MIDL__IWiaMiniDrv0054 
     * @returns {Integer} 
     */
    drvDeleteItem(__MIDL__IWiaMiniDrv0053, __MIDL__IWiaMiniDrv0054) {
        __MIDL__IWiaMiniDrv0053Marshal := __MIDL__IWiaMiniDrv0053 is VarRef ? "char*" : "ptr"

        result := ComCall(15, this, __MIDL__IWiaMiniDrv0053Marshal, __MIDL__IWiaMiniDrv0053, "int", __MIDL__IWiaMiniDrv0054, "int*", &__MIDL__IWiaMiniDrv0055 := 0, "HRESULT")
        return __MIDL__IWiaMiniDrv0055
    }

    /**
     * 
     * @param {Integer} __MIDL__IWiaMiniDrv0056 
     * @param {Pointer<Integer>} __MIDL__IWiaMiniDrv0057 
     * @returns {Integer} 
     */
    drvFreeDrvItemContext(__MIDL__IWiaMiniDrv0056, __MIDL__IWiaMiniDrv0057) {
        __MIDL__IWiaMiniDrv0057Marshal := __MIDL__IWiaMiniDrv0057 is VarRef ? "char*" : "ptr"

        result := ComCall(16, this, "int", __MIDL__IWiaMiniDrv0056, __MIDL__IWiaMiniDrv0057Marshal, __MIDL__IWiaMiniDrv0057, "int*", &__MIDL__IWiaMiniDrv0058 := 0, "HRESULT")
        return __MIDL__IWiaMiniDrv0058
    }

    /**
     * 
     * @param {Pointer<Integer>} __MIDL__IWiaMiniDrv0059 
     * @param {Integer} __MIDL__IWiaMiniDrv0060 
     * @param {Pointer<Integer>} __MIDL__IWiaMiniDrv0061 
     * @param {Pointer<Pointer<WIA_FORMAT_INFO>>} __MIDL__IWiaMiniDrv0062 
     * @param {Pointer<Integer>} __MIDL__IWiaMiniDrv0063 
     * @returns {HRESULT} 
     */
    drvGetWiaFormatInfo(__MIDL__IWiaMiniDrv0059, __MIDL__IWiaMiniDrv0060, __MIDL__IWiaMiniDrv0061, __MIDL__IWiaMiniDrv0062, __MIDL__IWiaMiniDrv0063) {
        __MIDL__IWiaMiniDrv0059Marshal := __MIDL__IWiaMiniDrv0059 is VarRef ? "char*" : "ptr"
        __MIDL__IWiaMiniDrv0061Marshal := __MIDL__IWiaMiniDrv0061 is VarRef ? "int*" : "ptr"
        __MIDL__IWiaMiniDrv0062Marshal := __MIDL__IWiaMiniDrv0062 is VarRef ? "ptr*" : "ptr"
        __MIDL__IWiaMiniDrv0063Marshal := __MIDL__IWiaMiniDrv0063 is VarRef ? "int*" : "ptr"

        result := ComCall(17, this, __MIDL__IWiaMiniDrv0059Marshal, __MIDL__IWiaMiniDrv0059, "int", __MIDL__IWiaMiniDrv0060, __MIDL__IWiaMiniDrv0061Marshal, __MIDL__IWiaMiniDrv0061, __MIDL__IWiaMiniDrv0062Marshal, __MIDL__IWiaMiniDrv0062, __MIDL__IWiaMiniDrv0063Marshal, __MIDL__IWiaMiniDrv0063, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pEventGUID 
     * @param {BSTR} bstrDeviceID 
     * @param {Integer} ulReserved 
     * @returns {HRESULT} 
     */
    drvNotifyPnpEvent(pEventGUID, bstrDeviceID, ulReserved) {
        bstrDeviceID := bstrDeviceID is String ? BSTR.Alloc(bstrDeviceID).Value : bstrDeviceID

        result := ComCall(18, this, Guid.Ptr, pEventGUID, BSTR, bstrDeviceID, "uint", ulReserved, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} __MIDL__IWiaMiniDrv0064 
     * @returns {HRESULT} 
     */
    drvUnInitializeWia(__MIDL__IWiaMiniDrv0064) {
        __MIDL__IWiaMiniDrv0064Marshal := __MIDL__IWiaMiniDrv0064 is VarRef ? "char*" : "ptr"

        result := ComCall(19, this, __MIDL__IWiaMiniDrv0064Marshal, __MIDL__IWiaMiniDrv0064, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWiaMiniDrv.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.drvInitializeWia := CallbackCreate(GetMethod(implObj, "drvInitializeWia"), flags, 10)
        this.vtbl.drvAcquireItemData := CallbackCreate(GetMethod(implObj, "drvAcquireItemData"), flags, 5)
        this.vtbl.drvInitItemProperties := CallbackCreate(GetMethod(implObj, "drvInitItemProperties"), flags, 4)
        this.vtbl.drvValidateItemProperties := CallbackCreate(GetMethod(implObj, "drvValidateItemProperties"), flags, 6)
        this.vtbl.drvWriteItemProperties := CallbackCreate(GetMethod(implObj, "drvWriteItemProperties"), flags, 5)
        this.vtbl.drvReadItemProperties := CallbackCreate(GetMethod(implObj, "drvReadItemProperties"), flags, 6)
        this.vtbl.drvLockWiaDevice := CallbackCreate(GetMethod(implObj, "drvLockWiaDevice"), flags, 4)
        this.vtbl.drvUnLockWiaDevice := CallbackCreate(GetMethod(implObj, "drvUnLockWiaDevice"), flags, 4)
        this.vtbl.drvAnalyzeItem := CallbackCreate(GetMethod(implObj, "drvAnalyzeItem"), flags, 4)
        this.vtbl.drvGetDeviceErrorStr := CallbackCreate(GetMethod(implObj, "drvGetDeviceErrorStr"), flags, 5)
        this.vtbl.drvDeviceCommand := CallbackCreate(GetMethod(implObj, "drvDeviceCommand"), flags, 6)
        this.vtbl.drvGetCapabilities := CallbackCreate(GetMethod(implObj, "drvGetCapabilities"), flags, 6)
        this.vtbl.drvDeleteItem := CallbackCreate(GetMethod(implObj, "drvDeleteItem"), flags, 4)
        this.vtbl.drvFreeDrvItemContext := CallbackCreate(GetMethod(implObj, "drvFreeDrvItemContext"), flags, 4)
        this.vtbl.drvGetWiaFormatInfo := CallbackCreate(GetMethod(implObj, "drvGetWiaFormatInfo"), flags, 6)
        this.vtbl.drvNotifyPnpEvent := CallbackCreate(GetMethod(implObj, "drvNotifyPnpEvent"), flags, 4)
        this.vtbl.drvUnInitializeWia := CallbackCreate(GetMethod(implObj, "drvUnInitializeWia"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.drvInitializeWia)
        CallbackFree(this.vtbl.drvAcquireItemData)
        CallbackFree(this.vtbl.drvInitItemProperties)
        CallbackFree(this.vtbl.drvValidateItemProperties)
        CallbackFree(this.vtbl.drvWriteItemProperties)
        CallbackFree(this.vtbl.drvReadItemProperties)
        CallbackFree(this.vtbl.drvLockWiaDevice)
        CallbackFree(this.vtbl.drvUnLockWiaDevice)
        CallbackFree(this.vtbl.drvAnalyzeItem)
        CallbackFree(this.vtbl.drvGetDeviceErrorStr)
        CallbackFree(this.vtbl.drvDeviceCommand)
        CallbackFree(this.vtbl.drvGetCapabilities)
        CallbackFree(this.vtbl.drvDeleteItem)
        CallbackFree(this.vtbl.drvFreeDrvItemContext)
        CallbackFree(this.vtbl.drvGetWiaFormatInfo)
        CallbackFree(this.vtbl.drvNotifyPnpEvent)
        CallbackFree(this.vtbl.drvUnInitializeWia)
    }
}
