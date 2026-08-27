#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\HCHANGE.ahk" { HCHANGE }
#Import ".\NOTIFY_FILTER_AND_TYPE.ahk" { NOTIFY_FILTER_AND_TYPE }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PCLUSAPI_GET_CLUSTER_NOTIFY_V2 {
    value : IntPtr

    __value {
        set {
            if (value is PCLUSAPI_GET_CLUSTER_NOTIFY_V2) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * @param {HCHANGE} _hChange 
     * @param {Pointer<Pointer>} lpdwNotifyKey 
     * @param {Pointer<NOTIFY_FILTER_AND_TYPE>} pFilterAndType 
     * @param {Pointer<Integer>} _buffer 
     * @param {Pointer<Integer>} lpcchBufferSize 
     * @param {PWSTR} lpszObjectId 
     * @param {Pointer<Integer>} lpcchObjectId 
     * @param {PWSTR} lpszParentId 
     * @param {Pointer<Integer>} lpcchParentId 
     * @param {PWSTR} lpszName 
     * @param {Pointer<Integer>} lpcchName 
     * @param {PWSTR} lpszType 
     * @param {Pointer<Integer>} lpcchType 
     * @param {Integer} dwMilliseconds 
     * @returns {Integer} 
     */
    Call(_hChange, lpdwNotifyKey, pFilterAndType, _buffer, lpcchBufferSize, lpszObjectId, lpcchObjectId, lpszParentId, lpcchParentId, lpszName, lpcchName, lpszType, lpcchType, dwMilliseconds) {
        lpszObjectId := lpszObjectId is String ? StrPtr(lpszObjectId) : lpszObjectId
        lpszParentId := lpszParentId is String ? StrPtr(lpszParentId) : lpszParentId
        lpszName := lpszName is String ? StrPtr(lpszName) : lpszName
        lpszType := lpszType is String ? StrPtr(lpszType) : lpszType

        lpdwNotifyKeyMarshal := lpdwNotifyKey is VarRef ? "ptr*" : IntPtr
        pFilterAndTypeMarshal := pFilterAndType == 0 ? IntPtr : NOTIFY_FILTER_AND_TYPE.Ptr
        _bufferMarshal := _buffer is VarRef ? "char*" : IntPtr
        _bufferMarshal := _buffer == 0 ? IntPtr : "char*"
        lpcchBufferSizeMarshal := lpcchBufferSize is VarRef ? "uint*" : IntPtr
        lpcchBufferSizeMarshal := lpcchBufferSize == 0 ? IntPtr : "uint*"
        lpszObjectIdMarshal := lpszObjectId == 0 ? IntPtr : PWSTR
        lpcchObjectIdMarshal := lpcchObjectId is VarRef ? "uint*" : IntPtr
        lpcchObjectIdMarshal := lpcchObjectId == 0 ? IntPtr : "uint*"
        lpszParentIdMarshal := lpszParentId == 0 ? IntPtr : PWSTR
        lpcchParentIdMarshal := lpcchParentId is VarRef ? "uint*" : IntPtr
        lpcchParentIdMarshal := lpcchParentId == 0 ? IntPtr : "uint*"
        lpszNameMarshal := lpszName == 0 ? IntPtr : PWSTR
        lpcchNameMarshal := lpcchName is VarRef ? "uint*" : IntPtr
        lpcchNameMarshal := lpcchName == 0 ? IntPtr : "uint*"
        lpszTypeMarshal := lpszType == 0 ? IntPtr : PWSTR
        lpcchTypeMarshal := lpcchType is VarRef ? "uint*" : IntPtr
        lpcchTypeMarshal := lpcchType == 0 ? IntPtr : "uint*"
        dwMillisecondsMarshal := dwMilliseconds == 0 ? IntPtr : UInt32

        result := DllCall(this.value, HCHANGE, _hChange, lpdwNotifyKeyMarshal, lpdwNotifyKey, pFilterAndTypeMarshal, pFilterAndType, _bufferMarshal, _buffer, lpcchBufferSizeMarshal, lpcchBufferSize, lpszObjectIdMarshal, lpszObjectId, lpcchObjectIdMarshal, lpcchObjectId, lpszParentIdMarshal, lpszParentId, lpcchParentIdMarshal, lpcchParentId, lpszNameMarshal, lpszName, lpcchNameMarshal, lpcchName, lpszTypeMarshal, lpszType, lpcchTypeMarshal, lpcchType, dwMillisecondsMarshal, dwMilliseconds, UInt32)
        return result
    }

    /**
     * A PCLUSAPI_GET_CLUSTER_NOTIFY_V2 that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PCLUSAPI_GET_CLUSTER_NOTIFY_V2 {
        /**
         * Creates a PCLUSAPI_GET_CLUSTER_NOTIFY_V2 pointer that invokes the given AHK function when called.
         * @param {Func(HCHANGE, "ptr*", NOTIFY_FILTER_AND_TYPE, "char*", "uint*", PWSTR, "uint*", PWSTR, "uint*", PWSTR, "uint*", PWSTR, "uint*", UInt32) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 14)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 14 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HCHANGE, "ptr*", NOTIFY_FILTER_AND_TYPE.Ptr, "char*", "uint*", PWSTR, "uint*", PWSTR, "uint*", PWSTR, "uint*", PWSTR, "uint*", UInt32, UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
