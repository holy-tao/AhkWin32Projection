#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct PDXGK_INITIAL_COMPONENT_STATE {
    value : IntPtr

    __value {
        set {
            if (value is PDXGK_INITIAL_COMPONENT_STATE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} GraphicsDeviceHandle 
     * @param {Pointer<Void>} PrivateHandle 
     * @param {Integer} ComponentIndex 
     * @param {BOOLEAN} IsBlockingType 
     * @param {Integer} InitialFState 
     * @param {Guid} ComponentGuid 
     * @param {Integer} PowerComponentMappingFlag 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(GraphicsDeviceHandle, PrivateHandle, ComponentIndex, IsBlockingType, InitialFState, ComponentGuid, PowerComponentMappingFlag) {
        GraphicsDeviceHandleMarshal := GraphicsDeviceHandle is VarRef ? "ptr" : "ptr"
        PrivateHandleMarshal := PrivateHandle is VarRef ? "ptr" : "ptr"

        DllCall(this.value, GraphicsDeviceHandleMarshal, GraphicsDeviceHandle, PrivateHandleMarshal, PrivateHandle, UInt32, ComponentIndex, BOOLEAN, IsBlockingType, UInt32, InitialFState, Guid, ComponentGuid, UInt32, PowerComponentMappingFlag)
    }

    /**
     * A PDXGK_INITIAL_COMPONENT_STATE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PDXGK_INITIAL_COMPONENT_STATE {
        /**
         * Creates a PDXGK_INITIAL_COMPONENT_STATE pointer that invokes the given AHK function when called.
         * @param {Func("ptr", "ptr", UInt32, BOOLEAN, UInt32, Guid, UInt32) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 7)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 7 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", "ptr", UInt32, BOOLEAN, UInt32, Guid, UInt32, IntPtr])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
