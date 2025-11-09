#Requires AutoHotkey v2.0

#Include ./Yunit/Yunit.ahk
#Include ./YunitExtensions/Assert.ahk

#Include ../Windows/Win32/Devices/Display/Apis.ahk
#Include ../Windows/Win32/Security/Apis.ahk
#Include ../Windows/Win32/Security/Cryptography/Apis.ahk

class GeneratedConstantSmokeTests {

    PrimitiveConstants_Always_ReturnPrimitiveValues(){
        Assert.Equals(type(Display.INDIRECT_DISPLAY_INFO_FLAGS_SUPPORT_FP16), "Integer")
        Assert.Equals(Display.INDIRECT_DISPLAY_INFO_FLAGS_SUPPORT_FP16, 2)
    }

    StringConstants_Always_ReturnStringValue(){
        Assert.Equals(type(Security.SE_MANAGE_VOLUME_NAME), "String")
        Assert.Equals(Security.SE_MANAGE_VOLUME_NAME, "SeManageVolumePrivilege")
    }

    GuidConstants_Always_ReturnCorrectGuids(){
        val := Display.GUID_DEVINTERFACE_MONITOR
        
        Assert.Equals(type(val), "Guid")
        Assert.Equals(String(val), "{e6f07b5f-ee97-4a90-b076-33f57bf4eaa7}")
    }

    StructConstants_WithGuids_AreConstructedCorrectly(){
        val := Display.DEVPKEY_Device_ActivityId

        Assert.Equals(type(val), "DEVPROPKEY")
        Assert.Equals(val.pid, 4)
        Yunit.Assert(val.fmtid != 0)
        Assert.Equals(String(Guid(val.fmtid)), "{c50a3f10-aa5c-4247-b830-d6a6f8eaa310}")
    }

    StructConstants_WithArrays_AreConstructedCorrectly(){
        val := Security.SECURITY_NON_UNIQUE_AUTHORITY

        Assert.Equals(type(val), "SID_IDENTIFIER_AUTHORITY")

        Assert.Equals(val.Value[1], 0)
        Assert.Equals(val.Value[2], 0)
        Assert.Equals(val.Value[3], 0)
        Assert.Equals(val.Value[4], 0)
        Assert.Equals(val.Value[5], 0)
        Assert.Equals(val.Value[6], 4)
    }

    HandleConstants_Always_ReturnUnownedHandles(){
        val := Cryptography.BCRYPT_ECDSA_ALG_HANDLE

        Assert.Equals(type(val), "BCRYPT_ALG_HANDLE")
        Assert.Equals(val.Value, 241)
        Assert.Equals(val.owned, false)
    }
}