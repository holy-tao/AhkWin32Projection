#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\Variant\VARIANT.ahk
#Include ..\IUnknown.ahk

/**
 * Windows Imaging Component (WIC) proxy function for IPropertyBag2::Write.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/ktop-src/wic/-wic-codec-ipropertybag2-write-proxy
 * @namespace Windows.Win32.System.Com.StructuredStorage
 * @version v4.0.30319
 */
class IPropertyBag2 extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Read", "Write", "CountProperties", "GetPropertyInfo", "LoadObject"]

    /**
     * Learn how to read a FILESTREAM column to a file using the IBCPSession interface in OLE DB Driver for SQL Server and write a format file with this example.
     * @param {Integer} cProperties 
     * @param {Pointer<PROPBAG2>} pPropBag 
     * @param {IErrorLog} pErrLog 
     * @param {Pointer<HRESULT>} phrError 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/sql/ocs/docs/connect/oledb/ole-db-how-to/filestream/read-a-filestream-column-to-file-using-ibcpsession-ole-db
     */
    Read(cProperties, pPropBag, pErrLog, phrError) {
        phrErrorMarshal := phrError is VarRef ? "int*" : "ptr"

        pvarValue := VARIANT()
        result := ComCall(3, this, "uint", cProperties, "ptr", pPropBag, "ptr", pErrLog, "ptr", pvarValue, phrErrorMarshal, phrError, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pvarValue
    }

    /**
     * This article helps you to configure the Script Task.
     * @param {Integer} cProperties 
     * @param {Pointer<PROPBAG2>} pPropBag 
     * @param {Pointer<VARIANT>} pvarValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/sql/ocs/docs/integration-services/extending-packages-scripting-task-examples/write-event-log-script-task
     */
    Write(cProperties, pPropBag, pvarValue) {
        result := ComCall(4, this, "uint", cProperties, "ptr", pPropBag, "ptr", pvarValue, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    CountProperties() {
        result := ComCall(5, this, "uint*", &pcProperties := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pcProperties
    }

    /**
     * The GetPropertyInfo function returns a pointer to the property information of a given protocol.
     * @remarks
     * [*Experts*](e.md) and [*parsers*](p.md) can call the **GetPropertyInfo** function.
     * @param {Integer} iProperty 
     * @param {Integer} cProperties 
     * @param {Pointer<PROPBAG2>} pPropBag 
     * @param {Pointer<Integer>} pcProperties 
     * @returns {HRESULT} If the function is successful, the return value is a pointer to the property.
     * 
     * If the function is unsuccessful, the return value is **NULL**.
     * @see https://learn.microsoft.com/windows/win32/ktop-src/NetMon2/getpropertyinfo
     */
    GetPropertyInfo(iProperty, cProperties, pPropBag, pcProperties) {
        pcPropertiesMarshal := pcProperties is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, "uint", iProperty, "uint", cProperties, "ptr", pPropBag, pcPropertiesMarshal, pcProperties, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {PWSTR} pstrName 
     * @param {Integer} dwHint 
     * @param {IUnknown} pUnkObject 
     * @param {IErrorLog} pErrLog 
     * @returns {HRESULT} 
     */
    LoadObject(pstrName, dwHint, pUnkObject, pErrLog) {
        pstrName := pstrName is String ? StrPtr(pstrName) : pstrName

        result := ComCall(7, this, "ptr", pstrName, "uint", dwHint, "ptr", pUnkObject, "ptr", pErrLog, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
