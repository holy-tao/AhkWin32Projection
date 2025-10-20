#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Com.StructuredStorage
 * @version v4.0.30319
 */
class IPropertyBag2 extends IUnknown{
    /**
     * The interface identifier for IPropertyBag2
     * @type {Guid}
     */
    static IID => Guid("{22f55882-280b-11d0-a8a9-00a0c90c2004}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} cProperties 
     * @param {Pointer<PROPBAG2>} pPropBag 
     * @param {Pointer<IErrorLog>} pErrLog 
     * @param {Pointer<VARIANT>} pvarValue 
     * @param {Pointer<HRESULT>} phrError 
     * @returns {HRESULT} 
     */
    Read(cProperties, pPropBag, pErrLog, pvarValue, phrError) {
        result := ComCall(3, this, "uint", cProperties, "ptr", pPropBag, "ptr", pErrLog, "ptr", pvarValue, "ptr", phrError, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} cProperties 
     * @param {Pointer<PROPBAG2>} pPropBag 
     * @param {Pointer<VARIANT>} pvarValue 
     * @returns {HRESULT} 
     */
    Write(cProperties, pPropBag, pvarValue) {
        result := ComCall(4, this, "uint", cProperties, "ptr", pPropBag, "ptr", pvarValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pcProperties 
     * @returns {HRESULT} 
     */
    CountProperties(pcProperties) {
        result := ComCall(5, this, "uint*", pcProperties, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} iProperty 
     * @param {Integer} cProperties 
     * @param {Pointer<PROPBAG2>} pPropBag 
     * @param {Pointer<UInt32>} pcProperties 
     * @returns {HRESULT} 
     */
    GetPropertyInfo(iProperty, cProperties, pPropBag, pcProperties) {
        result := ComCall(6, this, "uint", iProperty, "uint", cProperties, "ptr", pPropBag, "uint*", pcProperties, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pstrName 
     * @param {Integer} dwHint 
     * @param {Pointer<IUnknown>} pUnkObject 
     * @param {Pointer<IErrorLog>} pErrLog 
     * @returns {HRESULT} 
     */
    LoadObject(pstrName, dwHint, pUnkObject, pErrLog) {
        pstrName := pstrName is String ? StrPtr(pstrName) : pstrName

        result := ComCall(7, this, "ptr", pstrName, "uint", dwHint, "ptr", pUnkObject, "ptr", pErrLog, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
