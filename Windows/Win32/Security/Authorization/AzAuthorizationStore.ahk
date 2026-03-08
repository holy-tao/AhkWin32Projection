#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Adds the specified security identifier (SID) in text form to the list of principals that act as delegated policy users. (IAzAuthorizationStore.AddDelegatedPolicyUser)
 * @remarks
 * Delegated policy users are principals that are allowed to read the subset of the policy data that the policy administrator of an [IAzApplication](nn-azroles-iazapplication.md) or [IAzScope](nn-azroles-iazscope.md) object uses to administer the delegated object.
 * 
 * >[!NOTE]
 * >Delegated policy users are not supported for XML stores.
 * 
 * To view the list of delegated policy users, use the [DelegatedPolicyUsers](nf-azroles-iazauthorizationstore-get_delegatedpolicyusers.md) property.
 * 
 * You must call the [Submit](nf-azroles-iazauthorizationstore-submit.md) method to persist any changes made by this method.
 * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazauthorizationstore-adddelegatedpolicyuser
 * @namespace Windows.Win32.Security.Authorization
 * @version v4.0.30319
 */
class AzAuthorizationStore extends Win32Struct
{
    static sizeof => 0

    static packingSize => 1
}
