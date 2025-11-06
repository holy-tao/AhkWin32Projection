#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Devices.ImageAcquisition
 * @version v4.0.30319
 */
class IWiaMiniDrv extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWiaMiniDrv
     * @type {Guid}
     */
    static IID => Guid("{d8cdee14-3c6c-11d2-9a35-00c04fa36145}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["drvInitializeWia", "drvAcquireItemData", "drvInitItemProperties", "drvValidateItemProperties", "drvWriteItemProperties", "drvReadItemProperties", "drvLockWiaDevice", "drvUnLockWiaDevice", "drvAnalyzeItem", "drvGetDeviceErrorStr", "drvDeviceCommand", "drvGetCapabilities", "drvDeleteItem", "drvFreeDrvItemContext", "drvGetWiaFormatInfo", "drvNotifyPnpEvent", "drvUnInitializeWia"]

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

        result := ComCall(3, this, __MIDL__IWiaMiniDrv0000Marshal, __MIDL__IWiaMiniDrv0000, "int", __MIDL__IWiaMiniDrv0001, "ptr", __MIDL__IWiaMiniDrv0002, "ptr", __MIDL__IWiaMiniDrv0003, "ptr", __MIDL__IWiaMiniDrv0004, "ptr", __MIDL__IWiaMiniDrv0005, "ptr*", __MIDL__IWiaMiniDrv0006, "ptr*", __MIDL__IWiaMiniDrv0007, __MIDL__IWiaMiniDrv0008Marshal, __MIDL__IWiaMiniDrv0008, "HRESULT")
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

        result := ComCall(4, this, __MIDL__IWiaMiniDrv0009Marshal, __MIDL__IWiaMiniDrv0009, "int", __MIDL__IWiaMiniDrv0010, "ptr", __MIDL__IWiaMiniDrv0011, "int*", &__MIDL__IWiaMiniDrv0012 := 0, "HRESULT")
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

        result := ComCall(6, this, __MIDL__IWiaMiniDrv0016Marshal, __MIDL__IWiaMiniDrv0016, "int", __MIDL__IWiaMiniDrv0017, "uint", __MIDL__IWiaMiniDrv0018, "ptr", __MIDL__IWiaMiniDrv0019, "int*", &__MIDL__IWiaMiniDrv0020 := 0, "HRESULT")
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

        result := ComCall(7, this, __MIDL__IWiaMiniDrv0021Marshal, __MIDL__IWiaMiniDrv0021, "int", __MIDL__IWiaMiniDrv0022, "ptr", __MIDL__IWiaMiniDrv0023, "int*", &__MIDL__IWiaMiniDrv0024 := 0, "HRESULT")
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

        result := ComCall(8, this, __MIDL__IWiaMiniDrv0025Marshal, __MIDL__IWiaMiniDrv0025, "int", __MIDL__IWiaMiniDrv0026, "uint", __MIDL__IWiaMiniDrv0027, "ptr", __MIDL__IWiaMiniDrv0028, "int*", &__MIDL__IWiaMiniDrv0029 := 0, "HRESULT")
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

        result := ComCall(13, this, __MIDL__IWiaMiniDrv0043Marshal, __MIDL__IWiaMiniDrv0043, "int", __MIDL__IWiaMiniDrv0044, "ptr", __MIDL__IWiaMiniDrv0045, "ptr*", __MIDL__IWiaMiniDrv0046, __MIDL__IWiaMiniDrv0047Marshal, __MIDL__IWiaMiniDrv0047, "HRESULT")
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

        result := ComCall(18, this, "ptr", pEventGUID, "ptr", bstrDeviceID, "uint", ulReserved, "HRESULT")
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
}
