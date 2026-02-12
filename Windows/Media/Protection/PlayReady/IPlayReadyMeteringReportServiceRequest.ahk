#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Protection.PlayReady
 * @version WindowsRuntime 1.4
 */
class IPlayReadyMeteringReportServiceRequest extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPlayReadyMeteringReportServiceRequest
     * @type {Guid}
     */
    static IID => Guid("{c12b231c-0ecd-4f11-a185-1e24a4a67fb7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_MeteringCertificate", "put_MeteringCertificate"]

    /**
     */
    MeteringCertificate {
        get => this.get_MeteringCertificate()
        set => this.put_MeteringCertificate(value)
    }

    /**
     * 
     * @param {Pointer<Pointer>} meteringCertBytes 
     * @returns {HRESULT} 
     */
    get_MeteringCertificate(meteringCertBytes) {
        result := ComCall(6, this, "ptr", meteringCertBytes, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} meteringCertBytes_length 
     * @param {Pointer<Integer>} meteringCertBytes 
     * @returns {HRESULT} 
     */
    put_MeteringCertificate(meteringCertBytes_length, meteringCertBytes) {
        meteringCertBytesMarshal := meteringCertBytes is VarRef ? "char*" : "ptr"

        result := ComCall(7, this, "uint", meteringCertBytes_length, meteringCertBytesMarshal, meteringCertBytes, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
