#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * @namespace Windows.Win32.System.Com
 */
class uCLSSPEC extends Win32Struct {
    static sizeof => 112

    static packingSize => 8

    class _tagged_union extends Win32Struct {
        static sizeof => 104
        static packingSize => 8

        class _ByName extends Win32Struct {
            static sizeof => 24
            static packingSize => 8

            /**
             * @type {PWSTR}
             */
            pPackageName {
                get => NumGet(this, 0, "ptr")
                set => NumPut("ptr", value, this, 0)
            }

            /**
             * @type {Guid}
             */
            PolicyId {
                get {
                    if(!this.HasProp("__PolicyId"))
                        this.__PolicyId := Guid(8, this)
                    return this.__PolicyId
                }
            }
        }

        class _ByObjectId extends Win32Struct {
            static sizeof => 32
            static packingSize => 4

            /**
             * @type {Guid}
             */
            ObjectId {
                get {
                    if(!this.HasProp("__ObjectId"))
                        this.__ObjectId := Guid(0, this)
                    return this.__ObjectId
                }
            }

            /**
             * @type {Guid}
             */
            PolicyId {
                get {
                    if(!this.HasProp("__PolicyId"))
                        this.__PolicyId := Guid(16, this)
                    return this.__PolicyId
                }
            }
        }

        /**
         * @type {Guid}
         */
        clsid {
            get {
                if(!this.HasProp("__clsid"))
                    this.__clsid := Guid(0, this)
                return this.__clsid
            }
        }

        /**
         * @type {PWSTR}
         */
        pFileExt {
            get => NumGet(this, 0, "ptr")
            set => NumPut("ptr", value, this, 0)
        }

        /**
         * @type {PWSTR}
         */
        pMimeType {
            get => NumGet(this, 0, "ptr")
            set => NumPut("ptr", value, this, 0)
        }

        /**
         * @type {PWSTR}
         */
        pProgId {
            get => NumGet(this, 0, "ptr")
            set => NumPut("ptr", value, this, 0)
        }

        /**
         * @type {PWSTR}
         */
        pFileName {
            get => NumGet(this, 0, "ptr")
            set => NumPut("ptr", value, this, 0)
        }

        /**
         * @type {_ByName}
         */
        ByName {
            get {
                if(!this.HasProp("__ByName"))
                    this.__ByName := uCLSSPEC._tagged_union._ByName(0, this)
                return this.__ByName
            }
        }

        /**
         * @type {_ByObjectId}
         */
        ByObjectId {
            get {
                if(!this.HasProp("__ByObjectId"))
                    this.__ByObjectId := uCLSSPEC._tagged_union._ByObjectId(0, this)
                return this.__ByObjectId
            }
        }
    }

    /**
     * @type {Integer}
     */
    tyspec {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {_tagged_union}
     */
    tagged_union {
        get {
            if(!this.HasProp("__tagged_union"))
                this.__tagged_union := uCLSSPEC._tagged_union(8, this)
            return this.__tagged_union
        }
    }
}
