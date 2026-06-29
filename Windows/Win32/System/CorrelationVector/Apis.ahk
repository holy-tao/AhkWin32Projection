#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit

#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\CORRELATION_VECTOR.ahk" { CORRELATION_VECTOR }

/**
 * @namespace Windows.Win32.System.CorrelationVector
 */

;@region Functions
/**
 * 
 * @param {Pointer<CORRELATION_VECTOR>} CorrelationVector 
 * @param {Integer} _Version 
 * @param {Pointer<Guid>} Guid 
 * @returns {Integer} 
 */
export RtlInitializeCorrelationVector(CorrelationVector, _Version, Guid) {
    result := DllCall("ntdll.dll\RtlInitializeCorrelationVector", CORRELATION_VECTOR.Ptr, CorrelationVector, "int", _Version, Guid.Ptr, Guid, UInt32)
    return result
}

/**
 * 
 * @param {Pointer<CORRELATION_VECTOR>} CorrelationVector 
 * @returns {Integer} 
 */
export RtlIncrementCorrelationVector(CorrelationVector) {
    result := DllCall("ntdll.dll\RtlIncrementCorrelationVector", CORRELATION_VECTOR.Ptr, CorrelationVector, UInt32)
    return result
}

/**
 * 
 * @param {Pointer<CORRELATION_VECTOR>} CorrelationVector 
 * @returns {Integer} 
 */
export RtlExtendCorrelationVector(CorrelationVector) {
    result := DllCall("ntdll.dll\RtlExtendCorrelationVector", CORRELATION_VECTOR.Ptr, CorrelationVector, UInt32)
    return result
}

/**
 * 
 * @param {Pointer<CORRELATION_VECTOR>} Vector 
 * @returns {Integer} 
 */
export RtlValidateCorrelationVector(Vector) {
    result := DllCall("ntdll.dll\RtlValidateCorrelationVector", CORRELATION_VECTOR.Ptr, Vector, UInt32)
    return result
}

;@endregion Functions
