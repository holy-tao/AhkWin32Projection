#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class userSTGMEDIUM extends Win32Struct
{
    static sizeof => 72

    static packingSize => 8

    class _STGMEDIUM_UNION extends Win32Struct {
        static sizeof => 64
        static packingSize => 8

        class _u extends Win32Struct {
            static sizeof => 56
            static packingSize => 8
    
            /**
             * @type {Pointer<userHMETAFILEPICT>}
             */
            hMetaFilePict {
                get => NumGet(this, 0, "ptr")
                set => NumPut("ptr", value, this, 0)
            }
        
            /**
             * @type {Pointer<userHENHMETAFILE>}
             */
            hHEnhMetaFile {
                get => NumGet(this, 0, "ptr")
                set => NumPut("ptr", value, this, 0)
            }
        
            /**
             * @type {Pointer<GDI_OBJECT>}
             */
            hGdiHandle {
                get => NumGet(this, 0, "ptr")
                set => NumPut("ptr", value, this, 0)
            }
        
            /**
             * @type {Pointer<userHGLOBAL>}
             */
            hGlobal {
                get => NumGet(this, 0, "ptr")
                set => NumPut("ptr", value, this, 0)
            }
        
            /**
             * @type {PWSTR}
             */
            lpszFileName {
                get => NumGet(this, 0, "ptr")
                set => NumPut("ptr", value, this, 0)
            }
        
            /**
             * @type {Pointer<BYTE_BLOB>}
             */
            pstm {
                get => NumGet(this, 0, "ptr")
                set => NumPut("ptr", value, this, 0)
            }
        
            /**
             * @type {Pointer<BYTE_BLOB>}
             */
            pstg {
                get => NumGet(this, 0, "ptr")
                set => NumPut("ptr", value, this, 0)
            }
        
        }
    
        /**
         * @type {Integer}
         */
        tymed {
            get => NumGet(this, 0, "uint")
            set => NumPut("uint", value, this, 0)
        }
    
        /**
         * @type {_u}
         */
        u{
            get {
                if(!this.HasProp("__u"))
                    this.__u := %this.__Class%._u(8, this)
                return this.__u
            }
        }
    
    }

    /**
     * @type {_STGMEDIUM_UNION}
     */
    u{
        get {
            if(!this.HasProp("__u"))
                this.__u := %this.__Class%._STGMEDIUM_UNION(0, this)
            return this.__u
        }
    }

    /**
     * @type {IUnknown}
     */
    pUnkForRelease {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }
}
