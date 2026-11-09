#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\ENCLAVE_PACKAGE_IDENTITY.ahk
#Include .\VBS_ENCLAVE_REPORT_VARDATA_HEADER.ahk

/**
 * @namespace Windows.Win32.System.Environment
 */
class VBS_ENCLAVE_REPORT_PACKAGE_ID extends Win32Struct {
    static sizeof => 48

    static packingSize => 8

    /**
     * @type {VBS_ENCLAVE_REPORT_VARDATA_HEADER}
     */
    Header {
        get {
            if(!this.HasProp("__Header"))
                this.__Header := VBS_ENCLAVE_REPORT_VARDATA_HEADER(0, this)
            return this.__Header
        }
    }

    /**
     * @type {ENCLAVE_PACKAGE_IDENTITY}
     */
    PackageIdentity {
        get {
            if(!this.HasProp("__PackageIdentity"))
                this.__PackageIdentity := ENCLAVE_PACKAGE_IDENTITY(8, this)
            return this.__PackageIdentity
        }
    }
}
