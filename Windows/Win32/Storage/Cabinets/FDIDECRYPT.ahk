#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\FDIDECRYPTTYPE.ahk" { FDIDECRYPTTYPE }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Win32.Storage.Cabinets
 */
export default struct FDIDECRYPT {
    #StructPack 8


    struct _cabinet {
        pHeaderReserve : IntPtr

        cbHeaderReserve : UInt16

        setID : UInt16

        iCabinet : Int32

    }

    struct _folder {
        pFolderReserve : IntPtr

        cbFolderReserve : UInt16

        iFolder : UInt16

    }

    struct _decrypt {
        pDataReserve : IntPtr

        cbDataReserve : UInt16

        pbData : IntPtr

        cbData : UInt16

        fSplit : BOOL

        cbPartial : UInt16

    }

    fdidt : FDIDECRYPTTYPE

    pvUser : IntPtr

    cabinet : FDIDECRYPT._cabinet

    static __New() {
        DefineProp(this.Prototype, 'folder', { type: FDIDECRYPT._folder, offset: 16 })
        DefineProp(this.Prototype, 'decrypt', { type: FDIDECRYPT._decrypt, offset: 16 })
        this.DeleteProp("__New")
    }
}
