#!/bin/bash
#install FlowActionsBasePack package (Version 3.0.0 Managed)
#https://unofficialsf.com/flow-action-and-screen-component-basepacks/
echo y | sfdx force:package:install --package 04t8b000001Eh4YAAS -w 10


#install FlowScreenComponentsBasePack package (Version 3.0.6 Unmanaged)
#https://unofficialsf.com/flow-action-and-screen-component-basepacks/
echo y | sfdx force:package:install --package 04t5G000003rUvVQAU -w 10


#install Datatable 4.0.3 package
#https://unofficialsf.com/datatable-lightning-web-component-for-flow-screens-2/#Installation
echo y | sfdx force:package:install --package 04t5G000003rUvLQAU -w 10


#install TimeWrap package
#https://appexchange.salesforce.com/appxListingDetail?listingId=a0N3u00000ONnm7EAD
echo y | sfdx force:package:install --package 04t2w000009BbjoAAC -w 10


#install ALERT! Instant Visual Feedback package
#https://appexchange.salesforce.com/appxListingDetail?listingId=a0N3A00000FZRGPUA5
echo y | sfdx force:package:install --package 04t4S000000HweFQAS -w 10 


#install Launch Flow Modal package
#https://appexchange.salesforce.com/appxListingDetail?listingId=a0N3A00000FZRGPUA5
echo y | sfdx force:package:install --package 04t2E000003VsuMQAS -w 10