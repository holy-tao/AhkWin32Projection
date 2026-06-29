#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Variant\VARENUM.ahk" { VARENUM }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.Devices.ImageAcquisition
 */
export default struct WIA_PROPERTY_INFO {
    #StructPack 8


    struct _ValidVal {

        struct _Range {
            Min : Int32

            Nom : Int32

            Max : Int32

            Inc : Int32

        }

        struct _RangeFloat {
            Min : Float64

            Nom : Float64

            Max : Float64

            Inc : Float64

        }

        struct _List {
            cNumList : Int32

            Nom : Int32

            pList : IntPtr

        }

        struct _ListFloat {
            cNumList : Int32

            Nom : Float64

            pList : IntPtr

        }

        struct _ListGuid {
            cNumList : Int32

            Nom : Guid

            pList : Guid.Ptr

        }

        struct _ListBStr {
            cNumList : Int32

            Nom : BSTR

            pList : BSTR.Ptr

        }

        struct _Flag {
            Nom : Int32

            ValidBits : Int32

        }

        struct _None {
            Dummy : Int32

        }

        Range : WIA_PROPERTY_INFO._ValidVal._Range

        static __New() {
            DefineProp(this.Prototype, 'RangeFloat', { type: WIA_PROPERTY_INFO._ValidVal._RangeFloat, offset: 0 })
            DefineProp(this.Prototype, 'List', { type: WIA_PROPERTY_INFO._ValidVal._List, offset: 0 })
            DefineProp(this.Prototype, 'ListFloat', { type: WIA_PROPERTY_INFO._ValidVal._ListFloat, offset: 0 })
            DefineProp(this.Prototype, 'ListGuid', { type: WIA_PROPERTY_INFO._ValidVal._ListGuid, offset: 0 })
            DefineProp(this.Prototype, 'ListBStr', { type: WIA_PROPERTY_INFO._ValidVal._ListBStr, offset: 0 })
            DefineProp(this.Prototype, 'Flag', { type: WIA_PROPERTY_INFO._ValidVal._Flag, offset: 0 })
            DefineProp(this.Prototype, 'None', { type: WIA_PROPERTY_INFO._ValidVal._None, offset: 0 })
            this.DeleteProp("__New")
        }
    }

    lAccessFlags : UInt32

    vt : VARENUM

    ValidVal : WIA_PROPERTY_INFO._ValidVal

}
