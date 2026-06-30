#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk
#Include .\HSTRING.ahk
#Include ..\..\Foundation\HRESULT.ahk

/**
 * @namespace Windows.Win32.System.WinRT
 */
class ICorrelationVectorSource extends IUnknown {

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICorrelationVectorSource
     * @type {Guid}
     */
    static IID => Guid("{152b8a3b-b9b9-4685-b56e-974847bc7545}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_CorrelationVector"]

    /**
     * @type {HSTRING} 
     */
    CorrelationVector {
        get => this.get_CorrelationVector()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_CorrelationVector() {
        cv := HSTRING({Value: 0}, True)
        result := ComCall(3, this, "ptr", cv, "HRESULT")
        return cv
    }
}
