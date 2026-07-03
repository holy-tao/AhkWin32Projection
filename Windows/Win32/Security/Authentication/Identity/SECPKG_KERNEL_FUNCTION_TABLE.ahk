#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\KspCompleteTokenFn.ahk" { KspCompleteTokenFn }
#Import ".\KspDeleteContextFn.ahk" { KspDeleteContextFn }
#Import ".\KspGetTokenFn.ahk" { KspGetTokenFn }
#Import ".\KspInitContextFn.ahk" { KspInitContextFn }
#Import ".\KspInitPackageFn.ahk" { KspInitPackageFn }
#Import ".\KspMakeSignatureFn.ahk" { KspMakeSignatureFn }
#Import ".\KspMapHandleFn.ahk" { KspMapHandleFn }
#Import ".\KspQueryAttributesFn.ahk" { KspQueryAttributesFn }
#Import ".\KspSealMessageFn.ahk" { KspSealMessageFn }
#Import ".\KspSerializeAuthDataFn.ahk" { KspSerializeAuthDataFn }
#Import ".\KspSetPagingModeFn.ahk" { KspSetPagingModeFn }
#Import ".\KspUnsealMessageFn.ahk" { KspUnsealMessageFn }
#Import ".\KspVerifySignatureFn.ahk" { KspVerifySignatureFn }
#Import ".\SpExportSecurityContextFn.ahk" { SpExportSecurityContextFn }
#Import ".\SpImportSecurityContextFn.ahk" { SpImportSecurityContextFn }

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct SECPKG_KERNEL_FUNCTION_TABLE {
    #StructPack 8

    Initialize : KspInitPackageFn

    DeleteContext : KspDeleteContextFn

    InitContext : KspInitContextFn

    MapHandle : KspMapHandleFn

    Sign : KspMakeSignatureFn

    Verify : KspVerifySignatureFn

    Seal : KspSealMessageFn

    Unseal : KspUnsealMessageFn

    GetToken : KspGetTokenFn

    QueryAttributes : KspQueryAttributesFn

    CompleteToken : KspCompleteTokenFn

    ExportContext : SpExportSecurityContextFn

    ImportContext : SpImportSecurityContextFn

    SetPackagePagingMode : KspSetPagingModeFn

    SerializeAuthData : KspSerializeAuthDataFn

}
