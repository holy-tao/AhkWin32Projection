#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Handle.ahk
/**
 * @namespace Windows.Win32.System.CorrelationVector
 * @version v4.0.30319
 */
class CorrelationVector {

;@region Constants

    /**
     * @type {Integer (UInt32)}
     */
    static RTL_CORRELATION_VECTOR_STRING_LENGTH => 129

    /**
     * @type {Integer (UInt32)}
     */
    static RTL_CORRELATION_VECTOR_V1_PREFIX_LENGTH => 16

    /**
     * @type {Integer (UInt32)}
     */
    static RTL_CORRELATION_VECTOR_V1_LENGTH => 64

    /**
     * @type {Integer (UInt32)}
     */
    static RTL_CORRELATION_VECTOR_V2_PREFIX_LENGTH => 22

    /**
     * @type {Integer (UInt32)}
     */
    static RTL_CORRELATION_VECTOR_V2_LENGTH => 128
;@endregion Constants

;@region Methods
    /**
     * 
     * @param {Pointer<CORRELATION_VECTOR>} CorrelationVector 
     * @param {Integer} Version 
     * @param {Pointer<Guid>} Guid 
     * @returns {Integer} 
     */
    static RtlInitializeCorrelationVector(CorrelationVector, Version, Guid) {
        result := DllCall("ntdll.dll\RtlInitializeCorrelationVector", "ptr", CorrelationVector, "int", Version, "ptr", Guid, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<CORRELATION_VECTOR>} CorrelationVector 
     * @returns {Integer} 
     */
    static RtlIncrementCorrelationVector(CorrelationVector) {
        result := DllCall("ntdll.dll\RtlIncrementCorrelationVector", "ptr", CorrelationVector, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<CORRELATION_VECTOR>} CorrelationVector 
     * @returns {Integer} 
     */
    static RtlExtendCorrelationVector(CorrelationVector) {
        result := DllCall("ntdll.dll\RtlExtendCorrelationVector", "ptr", CorrelationVector, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<CORRELATION_VECTOR>} Vector 
     * @returns {Integer} 
     */
    static RtlValidateCorrelationVector(Vector) {
        result := DllCall("ntdll.dll\RtlValidateCorrelationVector", "ptr", Vector, "uint")
        return result
    }

;@endregion Methods
}
