#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\KspInitPackageFn.ahk" { KspInitPackageFn }
#Import ".\KspVerifySignatureFn.ahk" { KspVerifySignatureFn }
#Import ".\KspMakeSignatureFn.ahk" { KspMakeSignatureFn }
#Import ".\KspMapHandleFn.ahk" { KspMapHandleFn }
#Import ".\SpImportSecurityContextFn.ahk" { SpImportSecurityContextFn }
#Import ".\KspSetPagingModeFn.ahk" { KspSetPagingModeFn }
#Import ".\KspQueryAttributesFn.ahk" { KspQueryAttributesFn }
#Import ".\SpExportSecurityContextFn.ahk" { SpExportSecurityContextFn }
#Import ".\KspSealMessageFn.ahk" { KspSealMessageFn }
#Import ".\KspGetTokenFn.ahk" { KspGetTokenFn }
#Import ".\KspSerializeAuthDataFn.ahk" { KspSerializeAuthDataFn }
#Import ".\KspUnsealMessageFn.ahk" { KspUnsealMessageFn }
#Import ".\KspDeleteContextFn.ahk" { KspDeleteContextFn }
#Import ".\KspInitContextFn.ahk" { KspInitContextFn }
#Import ".\KspCompleteTokenFn.ahk" { KspCompleteTokenFn }

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
