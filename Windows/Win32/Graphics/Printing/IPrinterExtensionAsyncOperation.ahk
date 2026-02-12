#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class IPrinterExtensionAsyncOperation extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPrinterExtensionAsyncOperation
     * @type {Guid}
     */
    static IID => Guid("{108d6a23-6a4b-4552-9448-68b427186acd}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Cancel"]

    /**
     * Cancel Method (RDS)
     * @remarks
     * When you call **Cancel**, [ReadyState](./readystate-property-rds.md) is automatically set to **adcReadyStateLoaded**, and the [Recordset](../ado-api/recordset-object-ado.md) will be empty.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/sql/ocs/docs/ado/reference/rds-api/cancel-method-rds
     */
    Cancel() {
        result := ComCall(3, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
